import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:school_watch_semeru/common/error/failure.dart';

import '../../../common/error/network_exceptions.dart';
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

  return FakeReportRepository();
}

class FakeReportRepository implements IReportRepository {
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
        'https://picsum.photos/100/100'
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
  Future<Either<Failure, Comment>> postComment({required String reportId, required String comment, CancelToken? cancelToken}) async {
    try {
      await Future.delayed(kDurationLong);
      final newComment = Comment(
        comment: comment,
        author: const Author(avatar: 'https://picsum.photos/100/100', name: 'John Doe', id: '1'),
        createdAt: DateTime.now(),
      );
      return right(newComment);
    } catch(e) {
      final exception = NetworkExceptions.getDioException(e);
      return left(Failure(exception.getErrorMessage()));
    }
  }
}

class ReportRepository implements IReportRepository {
  const ReportRepository(this._client);

  final HttpClient _client;

  @override
  Future<List<Report>> getReports({
    required ReportQuery query,
    CancelToken? cancelToken,
  }) async {
    final response = await _client.get(
      '/reports',
      queryParameters: {
        'page': query.page,
        'take': query.take,
      },
      cancelToken: cancelToken,
    );

    final reports = (response['data'] as List<dynamic>)
        .map((e) => Report.fromJson(e))
        .toList();

    return reports;
  }

  @override
  Future<ReportDetail> getReport(
      {required String reportId, CancelToken? cancelToken}) {
    // TODO: implement getReport
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Comment>> postComment({required String reportId, required String comment, CancelToken? cancelToken}) {
    // TODO: implement postComment
    throw UnimplementedError();
  }
}
