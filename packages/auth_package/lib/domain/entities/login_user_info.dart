class LoggedUserInfo {
  final String email;
  final String username;
  final String sub;
  final String idToken;
  final String accessToken;
  final String refreshToken;
  final bool emailVerified;
  LoggedUserInfo({
    required this.email,
    required this.username,
    required this.sub,
    required this.idToken,
    required this.accessToken,
    required this.refreshToken,
    required this.emailVerified,
  });
}
