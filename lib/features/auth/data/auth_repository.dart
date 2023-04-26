import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/constant.dart';
import '../../../common/error/failure.dart';
import 'i_auth_repository.dart';

part 'auth_repository.g.dart';

@riverpod
Dio dio(DioRef ref) {
  return Dio();
}

@riverpod
IAuthRepository authRepository(AuthRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return AuthRepository(dio);
}

class AuthRepository implements IAuthRepository {
  const AuthRepository(this._dio);

  final Dio _dio;

  @override
  Future<Either<Failure, Unit>> login({
    required String email,
    required String password,
  }) async {
    try {
      await Future.delayed(kDurationLong);
      return right(unit);
    } catch(e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await Future.delayed(kDurationLong);
      return right(unit);
    } catch(e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await Future.delayed(kDurationLong);
      return right(unit);
    } catch(e) {
      return left(Failure(e.toString()));
    }
  }
}
