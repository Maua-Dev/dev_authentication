abstract class Failure implements Exception {
  String get message;
}

class ErrorLoginEmail extends Failure {
  ErrorLoginEmail(this.message);

  @override
  final String message;
}

class ErrorLogout extends Failure {
  ErrorLogout(this.message);

  @override
  final String message;
}

class ErrorGetLoggedUser extends Failure {
  ErrorGetLoggedUser(this.message);

  @override
  final String message;
}

class ErrorSignUpEmail extends Failure {
  ErrorSignUpEmail(this.message);

  @override
  final String message;
}

class ErrorConfirmSignUp extends Failure {
  ErrorConfirmSignUp(this.message);

  @override
  final String message;
}

class ErrorResendConfirmationCode extends Failure {
  ErrorResendConfirmationCode(this.message);

  @override
  final String message;
}

class ErrorEmailNotVerified extends Failure {
  ErrorEmailNotVerified(this.message);

  @override
  final String message;
}

class ErrorPasswordNotReset extends Failure {
  ErrorPasswordNotReset(this.message);

  @override
  final String message;
}

class ErrorResetPassword extends Failure {
  ErrorResetPassword(this.message);

  @override
  final String message;
}

class ErrorConfirmResetPassword extends Failure {
  ErrorConfirmResetPassword(this.message);

  @override
  final String message;
}

class ErrorEmailExists extends Failure {
  ErrorEmailExists(this.message);

  @override
  final String message;
}

class ErrorEmailInvalid extends Failure {
  ErrorEmailInvalid(this.message);

  @override
  final String message;
}
