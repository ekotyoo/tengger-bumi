import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tetenger_bumi/common/constants/constant.dart';

import '../../../auth/data/auth_repository.dart';
import '../../../auth/domain/auth_user.dart';
import '../../../report/domain/plant.dart';
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
Future<List<Plant>> getBookmarks(GetBookmarksRef ref) async {
  final authState = ref.watch(authStateProvider);
  if (authState is SignedIn) {
    final repo = ref.watch(authRepositoryProvider);
    final result = await repo.getBookmarks(userId: authState.id);
    return result.fold(
      (l) => <Plant>[],
      (r) => r,
    );
  }

  return <Plant>[];
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

  final result =
      await schoolRepo.getSchools(query: query, cancelToken: cancelToken);
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
