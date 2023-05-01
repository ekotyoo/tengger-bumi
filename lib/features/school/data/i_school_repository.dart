import 'package:dio/dio.dart';
import '../domain/school.dart';

abstract class ISchoolRepository {
  Future<List<School>> getSchools({
    String? query,
    CancelToken? cancelToken,
  });
}
