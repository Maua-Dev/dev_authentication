import 'package:string_validator/string_validator.dart' as validator;

class SignUpCredential {
  final String email;
  final String password;
  final String name;
  final bool isMaua;

  SignUpCredential._(
      {required this.email,
      required this.password,
      required this.name,
      required this.isMaua});
  bool get isValidEmail => validator.isEmail(email);
  bool get isValidPassword => password.isNotEmpty && password.length > 7;
  bool get isValidName => name.isNotEmpty;
  factory SignUpCredential.withEmailAndPassword(
      {required String email,
      required String password,
      required String name,
      required bool isMaua}) {
    return SignUpCredential._(
        email: email, password: password, isMaua: isMaua, name: name);
  }
}
