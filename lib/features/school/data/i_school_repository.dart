import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:school_watch_semeru/common/error/failure.dart';
import '../domain/school.dart';
import '../domain/school_detail.dart';
import '../domain/school_request.dart';

abstract class ISchoolRepository {
  Future<Either<Failure, List<School>>> getSchools({
    String? query,
    CancelToken? cancelToken,
  });

  Future<Either<Failure, SchoolDetail>> getSchool({
    required String schoolId,
    CancelToken? cancelToken,
  });

  Future<Either<Failure, Unit>> postSchool({
    required SchoolRequest school,
    File? coverImage,
  });
}
