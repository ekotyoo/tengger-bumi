import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';

part 'auth_user.g.dart';

@freezed
class AuthUserWrapper with _$AuthUserWrapper {
  const factory AuthUserWrapper({
    required String id,
    required String name,
    required String email,
    @JsonKey(name: 'access_token') String? accessToken,
    String? avatar,
    @Default(false) bool isAdmin,
  }) = _AuthUserWrapper;

  factory AuthUserWrapper.fromJson(Map<String, dynamic> json) => _$AuthUserWrapperFromJson(json);
}

@freezed
class AuthUser with _$AuthUser {
  const factory AuthUser.signedIn({
    required String id,
    required String name,
    required String email,
    required String? accessToken,
    String? avatar,
    @Default(false) bool isAdmin,
  }) = SignedIn;

  const factory AuthUser.signedOut() = SignedOut;

  factory AuthUser.fromJson(Map<String, dynamic> json) => _$AuthUserFromJson(json);
}
