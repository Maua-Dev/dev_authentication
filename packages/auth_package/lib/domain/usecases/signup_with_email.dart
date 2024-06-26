import 'package:auth_package/domain/entities/signup_credential.dart';
import 'package:auth_package/domain/errors/errors.dart';
import 'package:auth_package/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

abstract class SignupWithEmail {
  Future<Either<Failure, Unit>> call(SignUpCredential credential);
}

class SignupWithEmailImpl implements SignupWithEmail {
  final LoginRepository _repository;

  SignupWithEmailImpl(this._repository);
  @override
  Future<Either<Failure, Unit>> call(SignUpCredential credential) async {
    if (!credential.isValidEmail) {
      return Left(ErrorLoginEmail('Email Invalido. Verifique novamente.'));
    } else if (!credential.isValidPassword) {
      return Left(ErrorLoginEmail('Senha fraca. Tente novamente.'));
    } else if (!credential.isValidName) {
      return Left(ErrorLoginEmail('Nome invalido. Tente novamente.'));
    }
    return await _repository.signUpEmail(
        name: credential.name,
        email: credential.email,
        password: credential.password,
        isMaua: credential.isMaua);
  }
}
