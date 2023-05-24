import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http_parser/http_parser.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/error/failure.dart';
import '../../../common/error/network_exceptions.dart';
import '../../../common/services/http_client.dart';
import '../domain/school_detail.dart';
import '../domain/school_request.dart';
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
      {required int schoolId, CancelToken? cancelToken}) async {
    try {
      final response = await _client.get('/school/$schoolId');
      var school = SchoolDetail.fromJson(response['data']);
      if (school.image != null) {
        school = school.copyWith(
          image: '${school.image}'.replaceAll('public', kBaseUrl),
        );
      }

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

  @override
  Future<Either<Failure, Unit>> updateSchool({
    required int schoolId,
    required String name,
    required String address,
    File? cover,
    String? deletedCover,
  }) async {
    try {
      final schoolMap = {
        'name': name,
        'address': address,
        'deleted_cover': deletedCover,
      };
      final formData = FormData.fromMap(schoolMap);

      if (cover != null) {
        final path = cover.path;
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
      final response = await _client.put(
        '/school/$schoolId',
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
