import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/auth_user.dart';
import '../../../common/error/network_exceptions.dart';
import '../../../common/services/auth_interceptor.dart';
import '../../../common/services/http_client.dart';
import '../../../common/constants/constant.dart';
import '../../../common/error/failure.dart';
import 'i_auth_repository.dart';

part 'auth_repository.g.dart';

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
      final result = await _client.post('/auth/signin', data: {
        'email': email,
        'password': password,
      });
      final response = AuthUserWrapper.fromJson(result['data']);
      final user = AuthUser.signedIn(
        id: response.id,
        name: response.name,
        email: response.email,
        avatar: '${response.avatar}'.replaceAll('public', kBaseUrl),
        accessToken: response.accessToken,
      ) as SignedIn;

      final prefs = await SharedPreferences.getInstance();

      prefs.setString(kAccessToken, user.accessToken ?? '');

      ref.read(authStateProvider.notifier).state = user;
      return right(user);
    } catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return left(Failure(exception.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, AuthUser>> loginWithToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(kAccessToken);

      final result = await _client.post('/auth/signin/token');
      final response = AuthUserWrapper.fromJson(result['data']);
      final user = AuthUser.signedIn(
        id: response.id,
        name: response.name,
        email: response.email,
        avatar: '${response.avatar}'.replaceAll('public', kBaseUrl),
        accessToken: token,
      ) as SignedIn;

      ref.read(authStateProvider.notifier).state = user;
      return right(user);
    } catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return left(Failure(exception.getErrorMessage(), cause: exception));
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
      );

      return right(dummyUser);
    } catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return left(Failure(exception.getErrorMessage()));
    }
  }
}
