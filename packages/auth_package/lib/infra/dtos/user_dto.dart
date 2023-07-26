import 'package:auth_package/domain/entities/login_user_info.dart';

class UserDto extends LoggedUserInfo {
  UserDto(
      {required super.email,
      required super.username,
      required super.sub,
      required super.idToken,
      required super.accessToken,
      required super.refreshToken,
      required super.emailVerified});
}
