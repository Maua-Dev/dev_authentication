import 'package:auth_package/domain/entities/new_password.dart';
import 'package:auth_package/domain/errors/errors.dart';
import 'package:auth_package/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

abstract class ConfirmNewPassword {
  Future<Either<Failure, Unit>> call(NewPassword newPassword);
}

class ConfirmNewPasswordImpl implements ConfirmNewPassword {
  final LoginRepository _repository;

  ConfirmNewPasswordImpl(this._repository);

  @override
  Future<Either<Failure, Unit>> call(NewPassword newPassword) async {
    if (!newPassword.isValidCode) {
      return Left(ErrorConfirmResetPassword('Código inválido'));
    } else if (!newPassword.isValidNewPassword) {
      return Left(ErrorConfirmResetPassword('Senha inválida'));
    } else if (!newPassword.isValidConfirmPassword) {
      return Left(ErrorConfirmResetPassword('Senhas não conferem'));
    }
    return await _repository.confirmResetPassword(
        email: newPassword.email,
        code: newPassword.code,
        newPassword: newPassword.newPassword);
  }
}
