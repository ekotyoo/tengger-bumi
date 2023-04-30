import 'package:dio/dio.dart';

import '../domain/report.dart';
import '../domain/report_query.dart';

abstract class IReportRepository {
  Future<List<Report>> getReports({
    required ReportQuery query,
    CancelToken? cancelToken,
  });
}
