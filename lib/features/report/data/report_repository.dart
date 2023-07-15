import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http_parser/http_parser.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:school_watch_semeru/features/report/domain/plant_request.dart';

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
  return ReportRepository(client);
}

class ReportRepository implements IReportRepository {
  ReportRepository(this._client);

  final HttpClient _client;

  @override
  Future<Either<Failure, List<Plant>>> getPlants({
    required ReportQuery query,
    CancelToken? cancelToken,
  }) async {
    debugPrint(query.toString());
    try {
      final response = await _client.get(
        '/plant',
        queryParameters: {'page': query.page, 'take': query.take},
        data: {
          'author_id': query.authorId
        },
      );

      final plants = (response['data'] as List<dynamic>).map(
        (e) {
          final r = Plant.fromJson(e);
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

      return right(plants);
    } catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return left(Failure(exception.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, ReportDetail>> getPlant({
    required int reportId,
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
      {required int reportId,
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
    required int reportId,
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
      {required int reportId,
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
      {required int reportId, CancelToken? cancelToken}) async {
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
  Future<Either<Failure, Plant>> postPlant(
    PlantRequest plant,
    List<File> images,
  ) async {
    try {
      final reportMap = plant.toJson();
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

      final response = await _client.post('/plant', data: formData);

      if (response['status'] == 'success' && response['data'] != null) {
        final plant = Plant.fromJson(response['data']);
        final newPlant = plant.copyWith(
          images: plant.images
              .map((e) => e.replaceAll('public', kBaseUrl))
              .toList(),
          author: plant.author.copyWith(
            avatar: plant.author.avatar?.replaceAll('public', kBaseUrl),
          ),
        );
        return right(newPlant);
      }

      return left(const Failure('Terjadi kesalahan, coba lagi nanti.'));
    } catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return left(Failure(exception.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, Plant>> updatePlant({
    required int reportId,
    required PlantRequest report,
    required List<File> images,
  }) async {
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

      final response = await _client.put('/report/$reportId', data: formData);

      if (response['status'] == 'success' && response['data'] != null) {
        final report = Plant.fromJson(response['data']);
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
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _client.get('/category', cancelToken: cancelToken);

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
    required int reportId,
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
    required int reportId,
    required int commentId,
    CancelToken? cancelToken,
  }) async {
    try {
      final response =
          await _client.delete('/report/$reportId/comment/$commentId');
      if (response['status'] == 'success') {
        return right(unit);
      }
      return left(const Failure('Gagal menghapus komentar'));
    } catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return left(Failure(exception.getErrorMessage()));
    }
  }
}
