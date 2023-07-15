import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/error/failure.dart';
import '../../../common/error/network_exceptions.dart';
import '../../../common/models/district.dart';
import '../../../common/models/province.dart';
import '../../../common/models/regency.dart';
import '../../../common/models/village.dart';
import '../../../common/services/http_client.dart';
import 'i_area_repository.dart';

part 'area_repository.g.dart';

@riverpod
IAreaRepository areaRepository(AreaRepositoryRef ref) {
  final client = ref.watch(httpClientProvider);
  return AreaRepository(client);
}

class AreaRepository implements IAreaRepository {
  AreaRepository(this._client);

  final HttpClient _client;


  @override
  Future<Either<Failure, List<Province>>> getProvinces() async {
    try {
      final response = await _client.get('/area/provinces');
      final result = (response['data'] as List<dynamic>).map((e) => Province.fromJson(e)).toList();
      return right(result);
    } catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return left(Failure(exception.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, List<District>>> getDistricts(int regencyId) async {
    try {
      final response = await _client.get('/area/districts/$regencyId');
      final result = (response['data'] as List<dynamic>).map((e) => District.fromJson(e)).toList();
      return right(result);
    } catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return left(Failure(exception.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, List<Regency>>> getRegencies(int provinceId) async {
    try {
      final response = await _client.get('/area/regencies/$provinceId');
      final result = (response['data'] as List<dynamic>).map((e) => Regency.fromJson(e)).toList();
      return right(result);
    } catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return left(Failure(exception.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, List<Village>>> getVillages(int districtId) async {
    try {
      final response = await _client.get('/area/villages/$districtId');
      final result = (response['data'] as List<dynamic>).map((e) => Village.fromJson(e)).toList();
      return right(result);
    } catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return left(Failure(exception.getErrorMessage()));
    }
  }
}