import 'package:dartz/dartz.dart';
import 'package:auth_package/domain/errors/errors.dart';
import 'package:auth_package/domain/repositories/login_repository.dart';

abstract class Logout {
  Future<Either<Failure, Unit>> call();
}

class LogoutImpl implements Logout {
  final LoginRepository _repository;

  LogoutImpl(this._repository);

  @override
  Future<Either<Failure, Unit>> call() async {
    return await _repository.logout();
  }
}
