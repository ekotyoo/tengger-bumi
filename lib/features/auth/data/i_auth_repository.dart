import 'package:fpdart/fpdart.dart';
import 'package:school_watch_semeru/features/auth/domain/auth_user.dart';

import '../../../common/error/failure.dart';

abstract class IAuthRepository {
  Future<Either<Failure, AuthUser>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, Unit>> register({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, AuthUser>> getAuthUser();

  Future<Either<Failure, Unit>> logout();
}
