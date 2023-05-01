import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:school_watch_semeru/features/report/domain/report_query.dart';

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

  debugPrint(result.toString());

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