import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
}
