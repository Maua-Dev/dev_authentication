import 'package:auth_package/infra/dtos/user_dto.dart';

abstract class LoginDatasource {
  Future<UserDto> loginEmail({required String email, required String password});
  Future<void> logout();
  Future<UserDto?> getLoggedUser();
  Future<void> signUpEmail(
      {required String email,
      required String password,
      required String name,
      required bool isMaua});
  Future<void> confirmSignUp({required String email, required String code});
  Future<void> resendConfirmationCode({required String email});
  Future<void> resetPassword({required String email});
  Future<void> confirmResetPassword(
      {required String email,
      required String code,
      required String newPassword});
  Future<bool> checkEmailExists({required String email});
}
