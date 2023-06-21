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
      return Left(ErrorLoginEmail('Error login with email'));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await datasource.logout();
      return const Right(unit);
    } catch (e) {
      return Left(ErrorLogout('Error logout'));
    }
  }

  @override
  Future<Either<Failure, LoggedUserInfo>> getLoggedUser() async {
    try {
      final user = await datasource.getLoggedUser();
      if (user != null) {
        return Right(user);
      }
      return Left(ErrorGetLoggedUser('Error get logged user'));
    } catch (e) {
      return Left(ErrorGetLoggedUser('Error get logged user'));
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
      return Left(ErrorSignUpEmail('Error sign up with email'));
    }
  }

  @override
  Future<Either<Failure, Unit>> confirmSignUp(
      {required String email, required String code}) async {
    try {
      await datasource.confirmSignUp(email: email, code: code);
      return const Right(unit);
    } catch (e) {
      return Left(ErrorConfirmSignUp('Error confirm sign up'));
    }
  }

  @override
  Future<Either<Failure, Unit>> resendConfirmationCode(
      {required String email}) async {
    try {
      await datasource.resendConfirmationCode(email: email);
      return const Right(unit);
    } catch (e) {
      return Left(
          ErrorResendConfirmationCode('Error resend confirmation code'));
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
      return Left(ErrorConfirmResetPassword('Error confirm reset password'));
    }
  }

  @override
  Future<Either<Failure, Unit>> resetPassword({required String email}) async {
    try {
      await datasource.resetPassword(email: email);
      return const Right(unit);
    } catch (e) {
      return Left(ErrorResetPassword('Error reset password'));
    }
  }
}
