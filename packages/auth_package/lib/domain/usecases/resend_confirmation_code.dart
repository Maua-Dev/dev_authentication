import 'package:auth_package/domain/errors/errors.dart';
import 'package:auth_package/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

abstract class ResendConfirmationCode {
  Future<Either<Failure, Unit>> call({required String email});
}

class ResendConfirmationCodeImpl implements ResendConfirmationCode {
  final LoginRepository _repository;

  ResendConfirmationCodeImpl(this._repository);
  @override
  Future<Either<Failure, Unit>> call({required String email}) async {
    return await _repository.resendConfirmationCode(email: email);
  }
}
