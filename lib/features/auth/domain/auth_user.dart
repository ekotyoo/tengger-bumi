class AuthUser {
  const AuthUser({
    required this.id,
    required this.name,
    required this.email,
    this.accessToken,
    this.refreshToken,
  });

  final String id;
  final String name;
  final String email;
  final String? accessToken;
  final String? refreshToken;
}
