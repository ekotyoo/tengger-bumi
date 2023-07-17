import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tetenger_bumi/features/report/data/report_repository.dart';
import 'package:tetenger_bumi/features/report/domain/plant.dart';
import 'package:tetenger_bumi/features/report/domain/report_query.dart';

import '../../../../common/constants/constant.dart';

part 'plants_map_provider.g.dart';

@riverpod
class ReportMapFilterState extends _$ReportMapFilterState {
  @override
  ReportQuery build() {
    return const ReportQuery();
  }

  void updateFilterState(ReportQuery state) => this.state = state;
}

@riverpod
Future<List<Plant>> getPlantsMap(
  GetPlantsMapRef ref, {
  required ReportQuery query,
}) async {
  final repo = ref.watch(reportRepositoryProvider);

  final cancelToken = CancelToken();

  final link = ref.keepAlive();
  Timer? timer;

  ref.onDispose(() {
    cancelToken.cancel();
    timer?.cancel();
  });

  ref.onCancel(() {
    timer = Timer(const Duration(seconds: 30), () {
      link.close();
    });
  });

  await Future.delayed(kDurationLong);
  if (cancelToken.isCancelled) throw Exception();

  final result = await repo.getPlants(
    query: query,
    cancelToken: cancelToken,
  );
  return result.fold(
    (l) => const [],
    (r) => r,
  );
}
