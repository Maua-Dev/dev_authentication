import 'package:auth_package/domain/errors/errors.dart';
import 'package:auth_package/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

abstract class ConfirmSignup {
  Future<Either<Failure, Unit>> call(
      {required String email, required String code});
}

class ConfirmSignupImpl implements ConfirmSignup {
  final LoginRepository _repository;

  ConfirmSignupImpl(this._repository);

  @override
  Future<Either<Failure, Unit>> call(
      {required String email, required String code}) async {
    if (email.isEmpty || code.isEmpty) {
      return Left(ErrorConfirmSignUp('Code or email is invalid'));
    }
    return await _repository.confirmSignUp(email: email, code: code);
  }
}
