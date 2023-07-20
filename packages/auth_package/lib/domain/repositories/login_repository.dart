import 'package:dartz/dartz.dart';
import 'package:auth_package/domain/entities/login_user_info.dart';
import 'package:auth_package/domain/errors/errors.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoggedUserInfo>> loginEmail(
      {required String email, required String password});
  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure, LoggedUserInfo>> getLoggedUser();
  Future<Either<Failure, Unit>> signUpEmail(
      {required String email,
      required String password,
      required String name,
      required bool isMaua});
  Future<Either<Failure, Unit>> confirmSignUp(
      {required String email, required String code});
  Future<Either<Failure, Unit>> resendConfirmationCode({required String email});
  Future<Either<Failure, Unit>> resetPassword({required String email});
  Future<Either<Failure, Unit>> confirmResetPassword(
      {required String email,
      required String code,
      required String newPassword});
  Future<Either<Failure, bool>> checkEmailExists({required String email});
}
