import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/models/position.dart';
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
  final locations = const [
    Position(latitude: -7.991096, longitude: 112.506890),
    Position(latitude: -7.980968, longitude: 112.619544),
    Position(latitude: -7.971096, longitude: 112.526890),
    Position(latitude: -7.961096, longitude: 112.536890),
    Position(latitude: -7.951096, longitude: 112.546890),
    Position(latitude: -7.941096, longitude: 112.556890),
    Position(latitude: -7.931096, longitude: 112.566890),
    Position(latitude: -7.921096, longitude: 112.576890),
    Position(latitude: -7.911096, longitude: 112.586890),
    Position(latitude: -7.901096, longitude: 112.596890),
  ];

  @override
  Future<List<School>> getSchools(
      {String? query, CancelToken? cancelToken}) async {
    await Future.delayed(kDurationLong);

    return List.generate(
      10,
      (index) => School(
        id: '$index',
        name: 'SDN $index Sidomulyo',
        analysis: const SchoolAnalysis(
          preventionLevel: 'Prevention Level',
          emergencyResponseLevel: 'Emergency Level',
          recoveryLevel: 'Recovery Level',
        ),
        schoolLocation: locations[index],
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
