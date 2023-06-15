import 'package:dartz/dartz.dart';
import 'package:auth_package/domain/errors/errors.dart';
import 'package:auth_package/domain/repositories/login_repository.dart';

abstract class Logout {
  Future<Either<Failure, Unit>> call();
}

class LogoutImpl implements Logout {
  final LoginRepository repository;

  LogoutImpl(this.repository);

  @override
  Future<Either<Failure, Unit>> call() async {
    return await repository.logout();
  }
}
