import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http_parser/http_parser.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/models/position.dart';
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
  Future<List<Report>> getReports({
    required ReportQuery query,
    CancelToken? cancelToken,
  }) async {
    await Future.delayed(kDurationLong);

    final reports = List.generate(
      query.take * query.page,
      (index) => Report(
        id: '${query.page} - $index',
        reportType: 'reportType-$index',
        reportCategory: 'reportCategory-$index',
        description: 'description-$index',
        school: 'SDN $index Sidomulyo',
        position: const Position(latitude: .0, longitude: .0),
        author: Author(
          id: '$index',
          name: 'john-$index',
          avatar: 'https://picsum.photos/50/50',
        ),
        createdAt: DateTime.now(),
        likesCount: 10,
        dislikesCount: 10,
        commentsCount: 10,
        isActive: true,
        images: List.generate(3, (index) => 'https://picsum.photos/200/300'),
      ),
    );
    return reports;
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
          cancelToken: cancelToken,
          queryParameters: {'type': type});

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
