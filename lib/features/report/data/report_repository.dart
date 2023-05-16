import 'dart:io';

import 'package:dio/dio.dart';
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
import '../domain/author.dart';
import '../domain/report_query.dart';
import '../../../common/constants/constant.dart';
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
          'type': query.reportType.name.toLowerCase(),
          'is_active': query.isActive,
        },
      );

      final reports = (response['data'] as List<dynamic>).map(
        (e) {
          final r = Report.fromJson(e);
          final report = r.copyWith(
            images: r.images.map((e) => e.replaceAll('public', kBaseUrl)).toList(),
            author: r.author.copyWith(
              avatar: r.author.avatar.replaceAll('public', kBaseUrl),
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
  Future<ReportDetail> getReport(
      {required String reportId, CancelToken? cancelToken}) async {
    await Future.delayed(kDurationLong);

    return ReportDetail(
      id: '1',
      reportType: 'Type',
      reportCategory: 'Category',
      description: SWStrings.dummyLongText,
      author: const Author(
        id: '1',
        name: 'John Doe',
        avatar: 'https://picsum.photos/100/100',
      ),
      school: 'SDN 2 Sidomulyo',
      room: 'Kelas 1',
      createdAt: DateTime.now(),
      likesCount: 10,
      dislikesCount: 10,
      commentsCount: 10,
      isActive: true,
      images: [
        'https://picsum.photos/100/100',
        'https://picsum.photos/100/100',
        'https://picsum.photos/100/100',
      ],
      additionalInfo: {'Tanggal Kadaluwarsa': '12 Januari 2023'},
      comments: List.generate(
        5,
        (index) => Comment(
          author: Author(
            id: '$index',
            name: 'John Doe - $index',
            avatar: 'https://picsum.photos/100/100',
          ),
          comment: SWStrings.dummyText,
          createdAt: DateTime.now(),
        ),
      ),
    );
  }

  @override
  Future<Either<Failure, Comment>> addComment(
      {required String reportId,
      required String comment,
      CancelToken? cancelToken}) async {
    try {
      await Future.delayed(kDurationLong);
      final newComment = Comment(
        comment: comment,
        author: const Author(
            avatar: 'https://picsum.photos/100/100', name: 'John Doe', id: '1'),
        createdAt: DateTime.now(),
      );
      return right(newComment);
    } catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return left(Failure(exception.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, Unit>> addLike(
      {required String reportId, CancelToken? cancelToken}) async {
    try {
      await Future.delayed(kDurationLong);
      return right(unit);
    } catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return left(Failure(exception.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeLike(
      {required String reportId, CancelToken? cancelToken}) async {
    try {
      await Future.delayed(kDurationLong);
      return right(unit);
    } catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return left(Failure(exception.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeDislike(
      {required String reportId, CancelToken? cancelToken}) async {
    try {
      await Future.delayed(kDurationLong);
      return right(unit);
    } catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return left(Failure(exception.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, Unit>> addDislike(
      {required String reportId, CancelToken? cancelToken}) async {
    try {
      await Future.delayed(kDurationLong);
      return right(unit);
    } catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return left(Failure(exception.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, Unit>> postReport(
      ReportRequest report, List<File> images) async {
    try {
      final reportMap = report.toJson();
      final formData = FormData.fromMap(reportMap);

      final multipartFiles = <MapEntry<String, MultipartFile>>[];

      for (var image in images) {
        final path = image.path;
        final fileName = path.split('/').last;
        final extension = fileName.split('.').last;

        multipartFiles.add(MapEntry(
            'images',
            await MultipartFile.fromFile(
              path,
              filename: fileName,
              contentType:
                  MediaType('image', extension == 'jpg' ? 'jpeg' : extension),
            )));
      }
      formData.files.addAll(multipartFiles);

      final response = await _client.post('/report', data: formData);

      if (response['status'] == 'success') {
        return right(unit);
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
}
