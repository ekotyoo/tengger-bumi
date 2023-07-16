import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:school_watch_semeru/features/report/data/report_repository.dart';
import 'package:school_watch_semeru/features/report/domain/plant.dart';
import 'package:school_watch_semeru/features/report/domain/report_query.dart';

import '../../../../common/constants/constant.dart';

part 'plants_map_provider.g.dart';

@riverpod
Future<List<Plant>> getPlantsMap(GetPlantsMapRef ref) async {
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

  final result = await repo.getPlants(query: const ReportQuery(), cancelToken: cancelToken);
  return result.fold(
        (l) => const [],
        (r) => r,
  );
}