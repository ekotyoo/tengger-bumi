import 'package:fpdart/fpdart.dart';

import '../../../common/error/failure.dart';

abstract class IAuthRepository {
  Future<Either<Failure, Unit>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, Unit>> register({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, Unit>> logout();
}
