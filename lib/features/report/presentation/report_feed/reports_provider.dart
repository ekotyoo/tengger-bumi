import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/report_query.dart';
import '../../domain/report.dart';
import '../../data/report_repository.dart';

part 'reports_provider.g.dart';

@riverpod
Future<List<Report>> getReports(
  GetReportsRef ref, {
  required ReportQuery query,
}) async {
  final reportRepo = ref.watch(reportRepositoryProvider);

  final result = await reportRepo.getReports(
    query: query.copyWith(page: query.page + 1)
  );


  return result;
}

@riverpod
class ReportFilterState extends _$ReportFilterState {
  @override
  ReportQuery build() {
   return const ReportQuery();
  }

  void updateFilterState(ReportQuery state) => this.state = state;
}