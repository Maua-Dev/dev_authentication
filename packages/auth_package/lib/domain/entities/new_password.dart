class NewPassword {
  final String email;
  final String code;
  final String newPassword;
  final String confirmPassword;

  NewPassword(
      {required this.email,
      required this.code,
      required this.newPassword,
      required this.confirmPassword});

  bool get isValidCode => code.isNotEmpty;
  bool get isValidNewPassword =>
      newPassword.isNotEmpty &&
      newPassword.length > 7 &&
      newPassword.contains(RegExp(r'[A-Z]')) &&
      newPassword.contains(RegExp(r'[a-z]')) &&
      newPassword.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  bool get isValidConfirmPassword =>
      isValidNewPassword && confirmPassword == newPassword;
  bool get isValid => isValidCode && isValidConfirmPassword;
}
