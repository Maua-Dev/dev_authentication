import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';
import 'package:auth_package/infra/dtos/user_dto.dart';

import '../../infra/datasources/login_datasource.dart';

class CognitoDatasource implements LoginDatasource {
  final Logger logger = Modular.get();

  CognitoDatasource();
  @override
  Future<UserDto> loginEmail(
      {required String email, required String password}) async {
    final result = await Amplify.Auth.signIn(
      username: email,
      password: password,
    );
    logger.d('[CognitoDatasource] loginEmail: ${result.toJson()}}');
    final cognitoPlugin = Amplify.Auth.getPlugin(AmplifyAuthCognito.pluginKey);
    final session = await cognitoPlugin.fetchAuthSession();
    return UserDto(
        email: email,
        username: session.userPoolTokensResult.value.username,
        sub: session.userSubResult.value,
        accessToken: session.userPoolTokensResult.value.accessToken.raw);
  }

  @override
  Future<void> logout() async {
    final result = await Amplify.Auth.signOut();
    if (result is CognitoCompleteSignOut) {
      logger.d('Sign out completed successfully');
    } else if (result is CognitoFailedSignOut) {
      logger.d('Error signing user out: ${result.exception.message}');
      throw Exception();
    }
  }

  @override
  Future<UserDto?> getLoggedUser() async {
    try {
      final cognitoPlugin =
          Amplify.Auth.getPlugin(AmplifyAuthCognito.pluginKey);
      final session = await cognitoPlugin.fetchAuthSession();
      logger.d('User is signed in: ${session.isSignedIn}');
      if (!session.isSignedIn) {
        return null;
      }
      return UserDto(
          email: session.userPoolTokensResult.value.idToken.email!,
          username: session.userPoolTokensResult.value.username,
          sub: session.userSubResult.value,
          accessToken: session.userPoolTokensResult.value.accessToken.raw);
    } on AuthException catch (e) {
      logger.d('Error retrieving auth session: ${e.message}');
      throw Exception();
    }
  }
}
