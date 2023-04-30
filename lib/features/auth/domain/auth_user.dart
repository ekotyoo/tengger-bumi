import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';

part 'auth_user.g.dart';

@freezed
class AuthUser with _$AuthUser {
  const factory AuthUser.signedIn({
    required String id,
    required String name,
    required String email,
    required String accessToken,
    required String refreshToken,
    String? avatar,
    @Default(false) bool isAdmin,
  }) = SignedIn;

  const factory AuthUser.signedOut() = SignedOut;

  factory AuthUser.fromJson(Map<String, dynamic> json) => _$AuthUserFromJson(json);
}
