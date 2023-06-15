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
}
