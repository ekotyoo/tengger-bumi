import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http_parser/http_parser.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:school_watch_semeru/common/error/failure.dart';
import 'package:school_watch_semeru/common/error/network_exceptions.dart';
import 'package:school_watch_semeru/common/services/http_client.dart';
import 'package:school_watch_semeru/features/school/domain/school_detail.dart';
import 'package:school_watch_semeru/features/school/domain/school_request.dart';

import '../../../common/models/position.dart';
import '../../report/domain/author.dart';
import '../../report/domain/report.dart';
import '../domain/floor_plan.dart';
import '../domain/room.dart';
import '../domain/school_analysis.dart';
import '../../../common/constants/sw_durations.dart';
import 'i_school_repository.dart';
import '../domain/school.dart';

part 'school_repository.g.dart';

@riverpod
ISchoolRepository schoolRepository(SchoolRepositoryRef ref) {
  final client = ref.watch(httpClientProvider);
  return FakeSchoolRepository(client);
}

class FakeSchoolRepository implements ISchoolRepository {
  FakeSchoolRepository(this._client);

  final HttpClient _client;

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

  @override
  Future<Either<Failure, SchoolDetail>> getSchool(
      {required String schoolId, CancelToken? cancelToken}) async {
    const reportLocations = [
      Position(latitude: -7.943129, longitude: 112.603383),
      Position(latitude: -7.943162, longitude: 112.603411),
      Position(latitude: -7.943082, longitude: 112.603386),
      Position(latitude: -7.943095, longitude: 112.603420),
    ];

    return right(SchoolDetail(
      id: '1',
      name: 'SDN 1 Merjosari',
      schoolLocation:
          const Position(latitude: -7.943151, longitude: 112.603341),
      reports: List.generate(
        4,
        (index) => Report(
          id: '$index',
          reportType: 'reportType-$index',
          reportCategory: 'reportCategory-$index',
          position: reportLocations[index],
          description: 'description-$index',
          author: Author(id: '$index', name: 'name-$index', avatar: ''),
          school: 'school-$index',
          createdAt: DateTime.now(),
          likesCount: 10,
          dislikesCount: 10,
          commentsCount: 10,
          isActive: true,
        ),
      ),
      floorPlan: const FloorPlan(rooms: [
        Room(
          color: '',
          polygon: [
            Position(latitude: -7.943151, longitude: 112.603341),
            Position(latitude: -7.943177, longitude: 112.603413),
            Position(latitude: -7.943123, longitude: 112.603433),
            Position(latitude: -7.943097, longitude: 112.603359),
          ],
          label: 'Kelas 1',
        ),
        Room(
          color: '',
          polygon: [
            Position(latitude: -7.943097, longitude: 112.603359),
            Position(latitude: -7.943123, longitude: 112.603433),
            Position(latitude: -7.943074, longitude: 112.603447),
            Position(latitude: -7.943049, longitude: 112.603374),
          ],
          label: 'Kelas 2',
        ),
      ]),
      analysis: const SchoolAnalysis(
        recoveryLevel: 'Baik',
        emergencyResponseLevel: 'Baik',
        preventionLevel: 'Baik',
      ),
    ));
  }

  @override
  Future<Either<Failure, Unit>> postSchool(
      {required SchoolRequest school, File? coverImage}) async {
    try {
      final schoolMap = school.toJson();
      final formData = FormData.fromMap(schoolMap);

      if (coverImage != null) {
        final path = coverImage.path;
        final fileName = path.split('/').last;
        final extension = fileName.split('.').last;

        formData.files.add(
          MapEntry(
            'image',
            await MultipartFile.fromFile(
              path,
              filename: fileName,
              contentType: MediaType('image', extension == 'jpg' ? 'jpeg' : extension),
            ),
          ),
        );
      }

      final response = await _client.post(
        '/school',
        data: formData,
      );

      if (response['status'] == 'success') {
        return right(unit);
      }

      return left(const Failure('Terjadi kesalahan, coba lagi nanti.'));
    } catch (e) {
      final exceptions = NetworkExceptions.getDioException(e);
      return left(Failure(exceptions.getErrorMessage()));
    }
  }
}

class SchoolRepository implements ISchoolRepository {
  @override
  Future<List<School>> getSchools({String? query, CancelToken? cancelToken}) {
    // TODO: implement getSchools
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, SchoolDetail>> getSchool(
      {required String schoolId, CancelToken? cancelToken}) {
    // TODO: implement getSchool
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> postSchool(
      {required SchoolRequest school, File? coverImage}) {
    // TODO: implement postSchool
    throw UnimplementedError();
  }
}
