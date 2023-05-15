import 'package:fpdart/fpdart.dart';

import '../../../common/error/failure.dart';
import '../domain/auth_user.dart';

abstract class IAuthRepository {
  Future<Either<Failure, AuthUser>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, AuthUser>> loginWithToken();

  Future<Either<Failure, Unit>> register({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, AuthUser>> getAuthUser();

  Future<Either<Failure, Unit>> logout();
}
