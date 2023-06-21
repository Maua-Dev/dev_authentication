import 'package:auth_package/domain/errors/errors.dart';
import 'package:auth_package/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

abstract class ResetPassword {
  Future<Either<Failure, Unit>> call({required String email});
}

class ResetPasswordImpl implements ResetPassword {
  final LoginRepository _repository;

  ResetPasswordImpl(this._repository);

  @override
  Future<Either<Failure, Unit>> call({required String email}) async {
    return await _repository.resetPassword(email: email);
  }
}
