// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auth_package/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

import '../repositories/login_repository.dart';

abstract class CheckLoginExists {
  Future<Either<Failure, bool>> call({required String email});
}

class CheckLoginExistsImpl implements CheckLoginExists {
  final LoginRepository _repository;
  CheckLoginExistsImpl(this._repository);
  @override
  Future<Either<Failure, bool>> call({required String email}) async {
    return await _repository.checkEmailExists(email: email);
  }
}
