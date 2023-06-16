class LoggedUserInfo {
  final String email;
  final String username;
  final String sub;
  final String accessToken;
  final bool emailVerified;
  LoggedUserInfo({
    required this.email,
    required this.username,
    required this.sub,
    required this.accessToken,
    required this.emailVerified,
  });
}
