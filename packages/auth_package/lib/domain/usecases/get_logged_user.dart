import 'package:dartz/dartz.dart';
import 'package:auth_package/domain/entities/login_user_info.dart';
import 'package:auth_package/domain/errors/errors.dart';
import 'package:auth_package/domain/repositories/login_repository.dart';

abstract class GetLoggedUser {
  Future<Either<Failure, LoggedUserInfo>> call();
}

class GetLoggedUserImpl implements GetLoggedUser {
  final LoginRepository _repository;

  GetLoggedUserImpl(this._repository);

  @override
  Future<Either<Failure, LoggedUserInfo>> call() async {
    return await _repository.getLoggedUser();
  }
}
