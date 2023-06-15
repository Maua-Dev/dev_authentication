import 'package:dartz/dartz.dart';
import 'package:auth_package/domain/entities/login_user_info.dart';
import 'package:auth_package/domain/errors/errors.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoggedUserInfo>> loginEmail(
      {required String email, required String password});
  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure, LoggedUserInfo>> getLoggedUser();
}
