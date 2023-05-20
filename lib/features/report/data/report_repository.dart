import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http_parser/http_parser.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/report_request.dart';
import '../../../common/error/failure.dart';
import '../../../common/error/network_exceptions.dart';
import '../domain/category.dart';
import '../domain/comment.dart';
import '../domain/report_detail.dart';
import '../../../common/services/http_client.dart';
import '../domain/report_query.dart';
import '../domain/report.dart';
import 'i_report_repository.dart';

part 'report_repository.g.dart';

@riverpod
IReportRepository reportRepository(ReportRepositoryRef ref) {
  final client = ref.watch(httpClientProvider);
  return FakeReportRepository(client);
}

class FakeReportRepository implements IReportRepository {
  FakeReportRepository(this._client);

  final HttpClient _client;

  @override
  Future<Either<Failure, List<Report>>> getReports({
    required ReportQuery query,
    CancelToken? cancelToken,
  }) async {
    try {
      // TODO: Handle date time filter

      final response = await _client.get(
        '/report',
        queryParameters: {'page': query.page, 'take': query.take},
        data: {
          'type': query.reportType?.name.toLowerCase(),
          'is_active': query.isActive,
          'school_id': query.schoolId,
          'author_id': query.authorId
        },
      );

      final reports = (response['data'] as List<dynamic>).map(
        (e) {
          final r = Report.fromJson(e);
          final report = r.copyWith(
            images:
                r.images.map((e) => e.replaceAll('public', kBaseUrl)).toList(),
            author: r.author.copyWith(
              avatar: r.author.avatar?.replaceAll('public', kBaseUrl),
            ),
          );

          return report;
        },
      ).toList();

      return right(reports);
    } catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return left(Failure(exception.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, ReportDetail>> getReport({
    required String reportId,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.get('/report/$reportId');
      final result = ReportDetail.fromJson(response['data']);
      final report = result.copyWith(
        images:
            result.images.map((e) => e.replaceAll('public', kBaseUrl)).toList(),
        author: result.author.copyWith(
          avatar: result.author.avatar?.replaceAll('public', kBaseUrl),
        ),
      );
      return right(report);
    } catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return left(Failure(exception.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, Comment>> addComment(
      {required String reportId,
      required String comment,
      CancelToken? cancelToken}) async {
    try {
      final response = await _client.post('/comment', data: {
        'comment': comment,
        'report_id': reportId,
      });
      final result = Comment.fromJson(response['data']);
      final newComment = result.copyWith(
        author: result.author.copyWith(
          avatar: result.author.avatar?.replaceAll('public', kBaseUrl),
        ),
      );
      return right(newComment);
    } catch (e, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      final exception = NetworkExceptions.getDioException(e);
      return left(Failure(exception.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, List<Comment>>> getComments({
    required String reportId,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.get('/comment', data: {
        'report_id': reportId,
      });
      final result = (response['data'] as List<dynamic>).map((e) {
        final c = Comment.fromJson(e);
        final comment = c.copyWith(
          author: c.author.copyWith(
            avatar: c.author.avatar?.replaceAll('public', kBaseUrl),
          ),
        );
        return comment;
      }).toList();
      return right(result);
    } catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return left(Failure(exception.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, Unit>> addLike(
      {required String reportId,
      bool isLike = true,
      CancelToken? cancelToken}) async {
    try {
      final response = await _client
          .post('/report/$reportId/like', data: {'is_like': isLike});
      if (response['status'] == 'success') return right(unit);
      return left(const Failure('Terjadi kesalahan, coba lagi nanti'));
    } catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return left(Failure(exception.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeLike(
      {required String reportId, CancelToken? cancelToken}) async {
    try {
      final response = await _client.delete('/report/$reportId/like');
      if (response['status'] == 'success') return right(unit);
      return left(const Failure('Terjadi kesalahan, coba lagi nanti'));
    } catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return left(Failure(exception.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, Report>> postReport(
    ReportRequest report,
    List<File> images,
  ) async {
    try {
      final reportMap = report.toJson();
      final formData = FormData.fromMap(reportMap);

      final multipartFiles = <MapEntry<String, MultipartFile>>[];

      for (var image in images) {
        final path = image.path;
        final fileName = path.split('/').last;
        final extension = fileName.split('.').last;

        multipartFiles.add(
          MapEntry(
            'images',
            await MultipartFile.fromFile(
              path,
              filename: fileName,
              contentType:
                  MediaType('image', extension == 'jpg' ? 'jpeg' : extension),
            ),
          ),
        );
      }
      formData.files.addAll(multipartFiles);

      final response = await _client.post('/report', data: formData);

      if (response['status'] == 'success' && response['data'] != null) {
        final report = Report.fromJson(response['data']);
        final newReport = report.copyWith(
          images: report.images
              .map((e) => e.replaceAll('public', kBaseUrl))
              .toList(),
          author: report.author.copyWith(
            avatar: report.author.avatar?.replaceAll('public', kBaseUrl),
          ),
        );
        return right(newReport);
      }

      return left(const Failure('Terjadi kesalahan, coba lagi nanti.'));
    } catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return left(Failure(exception.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getCategories({
    required String type,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.get('/category',
          cancelToken: cancelToken, queryParameters: {'type': type});

      final categories = (response['data'] as List<dynamic>)
          .map((e) => Category.fromJson(e))
          .toList();

      return right(categories);
    } catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return left(Failure(exception.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteReport({
    required String reportId,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.delete('/report/$reportId');
      if (response['status'] == 'success') {
        return right(unit);
      }
      return left(const Failure('Gagal menghapus laporan'));
    } catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return left(Failure(exception.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteComment({
    required String reportId,
    required String commentId,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.delete('/report/$reportId/comment/$commentId');
      if (response['status'] == 'success') {
        return right(unit);
      }
      return left(const Failure('Gagal menghapus komentar'));
    } catch(e) {
      final exception = NetworkExceptions.getDioException(e);
      return left(Failure(exception.getErrorMessage()));
    }
  }
}
