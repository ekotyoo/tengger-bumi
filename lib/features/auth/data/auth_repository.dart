import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:school_watch_semeru/features/auth/domain/auth_user.dart';

import '../../../common/error/network_exceptions.dart';
import '../../../common/services/http_client.dart';
import '../../../common/constants/constant.dart';
import '../../../common/error/failure.dart';
import 'i_auth_repository.dart';

part 'auth_repository.g.dart';

enum AuthState { authenticated, unauthenticated }

final authStateProvider =
    StateProvider<AuthUser>((ref) => const AuthUser.signedOut());

@riverpod
IAuthRepository authRepository(AuthRepositoryRef ref) {
  final client = ref.watch(httpClientProvider);
  return AuthRepository(client, ref);
}

class AuthRepository implements IAuthRepository {
  const AuthRepository(this._client, this.ref);

  final HttpClient _client;
  final AuthRepositoryRef ref;

  @override
  Future<Either<Failure, AuthUser>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _client.post('/auth/login');

      // TODO: Save token to prefs

      return right(
        const AuthUser.signedIn(
          name: "Eko",
          email: "",
          id: "",
          isAdmin: false,
          accessToken: "",
          refreshToken: "",
        ),
      );
    } catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return left(Failure(exception.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await Future.delayed(kDurationLong);
      ref.read(authStateProvider.notifier).state = const AuthUser.signedOut();
      return right(unit);
    } catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return left(Failure(exception.getErrorMessage()));
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
    } catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return left(Failure(exception.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, AuthUser>> getAuthUser() async {
    try {
      await Future.delayed(kDurationLong);

      const dummyUser = AuthUser.signedIn(
        id: "id",
        name: "name",
        email: "email",
        accessToken: "accessToken",
        refreshToken: "refreshToken",
      );

      return right(dummyUser);
    } catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return left(Failure(exception.getErrorMessage()));
    }
  }
}
