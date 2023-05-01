import 'package:riverpod_annotation/riverpod_annotation.dart';

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
Future<List<School>> getSchools(GetSchoolsRef ref, {String? query}) async {
  final schoolRepo = ref.watch(schoolRepositoryProvider);

  final result = await schoolRepo.getSchools(query: query);

  return result;
}
