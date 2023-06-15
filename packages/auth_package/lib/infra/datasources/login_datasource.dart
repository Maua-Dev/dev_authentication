import 'package:auth_package/infra/dtos/user_dto.dart';

abstract class LoginDatasource {
  Future<UserDto> loginEmail({required String email, required String password});
  Future<void> logout();
  Future<UserDto?> getLoggedUser();
}
