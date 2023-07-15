import 'package:fpdart/fpdart.dart';

import '../../../common/models/district.dart';
import '../../../common/models/regency.dart';
import '../../../common/error/failure.dart';
import '../../../common/models/province.dart';
import '../../../common/models/village.dart';

abstract class IAreaRepository {
  Future<Either<Failure, List<Province>>> getProvinces();

  Future<Either<Failure, List<Regency>>> getRegencies(int provinceId);

  Future<Either<Failure, List<District>>> getDistricts(int regencyId);

  Future<Either<Failure, List<Village>>> getVillages(int districtId);
}