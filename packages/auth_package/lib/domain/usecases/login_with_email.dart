import 'package:dartz/dartz.dart';
import 'package:auth_package/domain/entities/login_credential.dart';
import 'package:auth_package/domain/entities/login_user_info.dart';
import 'package:auth_package/domain/errors/errors.dart';
import 'package:auth_package/domain/repositories/login_repository.dart';

abstract class LoginWithEmail {
  Future<Either<Failure, LoggedUserInfo>> call(LoginCredential credential);
}

class LoginWithEmailImpl implements LoginWithEmail {
  final LoginRepository _repository;

  LoginWithEmailImpl(this._repository);
  @override
  Future<Either<Failure, LoggedUserInfo>> call(
      LoginCredential credential) async {
    if (!credential.isValidEmail) {
      return Left(ErrorLoginEmail('Email Invalido. Verifique novamente.'));
    } else if (!credential.isValidPassword) {
      return Left(ErrorLoginEmail('Senha incorreta. Tente novamente.'));
    }

    return await _repository.loginEmail(
      email: credential.email,
      password: credential.password,
    );
  }
}
