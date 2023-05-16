import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http_parser/http_parser.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:school_watch_semeru/common/error/failure.dart';
import 'package:school_watch_semeru/common/error/network_exceptions.dart';
import 'package:school_watch_semeru/common/services/http_client.dart';
import 'package:school_watch_semeru/features/school/domain/school_detail.dart';
import 'package:school_watch_semeru/features/school/domain/school_request.dart';

import '../../../common/models/position.dart';
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
  Future<Either<Failure, List<School>>> getSchools(
      {String? query, CancelToken? cancelToken}) async {
    try {
      final response = await _client.get(
        '/school',
        cancelToken: cancelToken,
        queryParameters: {'name': query},
      );
      final schools = (response['data'] as List<dynamic>)
          .map((e) => School.fromJson(e))
          .toList();

      return right(schools);
    } catch (e, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      final exceptions = NetworkExceptions.getDioException(e);
      return left(Failure(exceptions.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, SchoolDetail>> getSchool(
      {required String schoolId, CancelToken? cancelToken}) async {
    try {
      final response = await _client.get('/school/$schoolId');
      var school = SchoolDetail.fromJson(response['data']);
      school = school.copyWith(image: '${school.image}'.replaceAll('public', kBaseUrl));

      return right(school);
    } catch (e, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      final exceptions = NetworkExceptions.getDioException(e);
      return left(Failure(exceptions.getErrorMessage()));
    }
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
              contentType:
                  MediaType('image', extension == 'jpg' ? 'jpeg' : extension),
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
  Future<Either<Failure, List<School>>> getSchools(
      {String? query, CancelToken? cancelToken}) {
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
