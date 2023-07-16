import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../../common/models/district.dart';
import '../../../common/models/regency.dart';
import '../../../common/error/failure.dart';
import '../../../common/models/province.dart';
import '../../../common/models/village.dart';

abstract class IAreaRepository {
  Future<Either<Failure, List<Province>>> getProvinces(
      {CancelToken? cancelToken});

  Future<Either<Failure, List<Regency>>> getAllRegencies(
      {CancelToken? cancelToken});

  Future<Either<Failure, List<Regency>>> getRegencies(
      {CancelToken? cancelToken, required int provinceId});

  Future<Either<Failure, List<District>>> getDistricts(
      {CancelToken? cancelToken, required int regencyId});

  Future<Either<Failure, List<Village>>> getVillages(
      {CancelToken? cancelToken, required int districtId});
}
