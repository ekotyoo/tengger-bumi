import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/school_analysis.dart';

import '../../../common/constants/sw_durations.dart';
import 'i_school_repository.dart';
import '../domain/school.dart';

part 'school_repository.g.dart';

@riverpod
ISchoolRepository schoolRepository(SchoolRepositoryRef ref) {
  return FakeSchoolRepository();
}

class FakeSchoolRepository implements ISchoolRepository {
  @override
  Future<List<School>> getSchools(
      {String? query, CancelToken? cancelToken}) async {
    await Future.delayed(kDurationLong);

    return List.generate(
      20,
      (index) => School(
        id: '$index',
        name: 'SDN $index Sidomulyo',
        analysis: const SchoolAnalysis(
          preventionLevel: 'Prevention Level',
          emergencyResponseLevel: 'Emergency Level',
          recoveryLevel: 'Recovery Level',
        ),
      ),
    );
  }
}

class SchoolRepository implements ISchoolRepository {
  @override
  Future<List<School>> getSchools({String? query, CancelToken? cancelToken}) {
    // TODO: implement getSchools
    throw UnimplementedError();
  }
}
