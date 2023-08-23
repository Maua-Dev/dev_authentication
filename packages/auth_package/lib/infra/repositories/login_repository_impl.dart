import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';
import 'package:auth_package/domain/entities/login_user_info.dart';
import 'package:auth_package/domain/errors/errors.dart';

import '../../domain/repositories/login_repository.dart';
import '../datasources/login_datasource.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource datasource;
  final Logger logger = Modular.get();

  LoginRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, LoggedUserInfo>> loginEmail(
      {required String email, required String password}) async {
    try {
      logger.i('LoginRepositoryImpl.loginEmail');
      final user =
          await datasource.loginEmail(email: email, password: password);
      return Right(user);
    } on ErrorEmailNotVerified catch (e) {
      logger.e(e);
      return Left(e);
    } on ErrorPasswordNotReset catch (e) {
      logger.e(e);
      return Left(e);
    } catch (e) {
      logger.e(e);
      return Left(ErrorLoginEmail('Error ao fazer login'));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await datasource.logout();
      return const Right(unit);
    } catch (e) {
      return Left(ErrorLogout('Error ao fazer logout'));
    }
  }

  @override
  Future<Either<Failure, LoggedUserInfo>> getLoggedUser() async {
    try {
      final user = await datasource.getLoggedUser();
      if (user != null) {
        return Right(user);
      }
      return Left(ErrorGetLoggedUser('Erro ao pegar usuário logado'));
    } catch (e) {
      return Left(ErrorGetLoggedUser('Error ao pegar usuário logado'));
    }
  }

  @override
  Future<Either<Failure, Unit>> signUpEmail(
      {required String email,
      required String password,
      required String name,
      required bool isMaua}) async {
    try {
      await datasource.signUpEmail(
          email: email, password: password, name: name, isMaua: isMaua);
      return const Right(unit);
    } catch (e) {
      return Left(ErrorSignUpEmail('Error ao fazer cadastro'));
    }
  }

  @override
  Future<Either<Failure, Unit>> confirmSignUp(
      {required String email, required String code}) async {
    try {
      await datasource.confirmSignUp(email: email, code: code);
      return const Right(unit);
    } catch (e) {
      return Left(ErrorConfirmSignUp('Error ao confirmar cadastro'));
    }
  }

  @override
  Future<Either<Failure, Unit>> resendConfirmationCode(
      {required String email}) async {
    try {
      await datasource.resendConfirmationCode(email: email);
      return const Right(unit);
    } catch (e) {
      return Left(ErrorResendConfirmationCode(
          'Error ao reenviar código de confirmação'));
    }
  }

  @override
  Future<Either<Failure, Unit>> confirmResetPassword(
      {required String email,
      required String code,
      required String newPassword}) async {
    try {
      await datasource.confirmResetPassword(
          email: email, code: code, newPassword: newPassword);
      return const Right(unit);
    } catch (e) {
      return Left(ErrorConfirmResetPassword('Error ao confirmar reset senha'));
    }
  }

  @override
  Future<Either<Failure, Unit>> resetPassword({required String email}) async {
    try {
      await datasource.resetPassword(email: email);
      return const Right(unit);
    } catch (e) {
      return Left(ErrorResetPassword('Error ao resetar senha'));
    }
  }

  @override
  Future<Either<Failure, bool>> checkEmailExists(
      {required String email}) async {
    try {
      final res = await datasource.checkEmailExists(email: email);
      if (res) {
        return Left(ErrorEmailExists('Email ja cadastrado'));
      }
      return Right(!res);
    } catch (e) {
      return Left(ErrorEmailInvalid('Email invalido'));
    }
  }
}
