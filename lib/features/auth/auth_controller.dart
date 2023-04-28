import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../common/services/auth_interceptor.dart';
import 'data/auth_repository.dart';
import 'domain/auth_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  late SharedPreferences prefs;

  @override
  Future<AuthUser> build() async {
    prefs = await SharedPreferences.getInstance();

    _validateToken();

    return _recoverLogin();
  }

  Future<AuthUser> _recoverLogin() async {
    final accessToken = prefs.getString(kAccessToken);

    if (accessToken == null) {
      return const AuthUser.signedOut();
    }

    final result = await ref.read(authRepositoryProvider).getAuthUser();

    return result.fold(
      (l) => throw Exception('Token null'),
      (r) => r,
    );
  }

  Future<void> logout() async {
    final result = await ref.read(authRepositoryProvider).logout();
    result.fold(
      (l) {},
      (r) {
        prefs.remove(kAccessToken);
        prefs.remove(kRefreshToken);
        return state = const AsyncValue<AuthUser>.data(AuthUser.signedOut());
      },
    );
  }

  void setAuthUser(AuthUser user) => state = AsyncValue<AuthUser>.data(user);

  void _validateToken() {
    ref.listenSelf((previous, next) {
      if (next.isLoading) return;
      if (next.hasError) {
        prefs.remove(kAccessToken);
        return;
      }

      final val = next.requireValue;
      val.map(
        signedIn: (user) => prefs.setString(kAccessToken, user.accessToken),
        signedOut: (_) => prefs.remove(kAccessToken),
      );
    });
  }
}
