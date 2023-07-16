import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tetenger_bumi/common/constants/constant.dart';

import '../../data/school_repository.dart';
import '../../domain/school.dart';

part 'schools_provider.g.dart';

@riverpod
class SchoolSearchQuery extends _$SchoolSearchQuery {
  @override
  String? build() {
    return null;
  }

  void updateSearchQuery(String? query) => state = query;
}

@riverpod
Future<List<School>> getSchools(GetSchoolsRef ref) async {
  final schoolRepo = ref.watch(schoolRepositoryProvider);
  final query = ref.watch(schoolSearchQueryProvider);

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

  final result = await schoolRepo.getSchools(query: query, cancelToken: cancelToken);
  return result.fold(
    (l) => const [],
    (r) => r,
  );
}

@riverpod
Future<List<School>> getSchoolsMap(GetSchoolsRef ref) async {
  final schoolRepo = ref.watch(schoolRepositoryProvider);

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

  final result = await schoolRepo.getSchools(cancelToken: cancelToken);
  return result.fold(
        (l) => const [],
        (r) => r,
  );
}