import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:auth_package/domain/errors/errors.dart';
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
    if (result.nextStep.signInStep == AuthSignInStep.confirmSignUp) {
      throw ErrorEmailNotVerified('Email não verificado');
    } else if (result.nextStep.signInStep == AuthSignInStep.resetPassword) {
      throw ErrorPasswordNotReset('Reset password');
    }
    logger.d('[CognitoDatasource] loginEmail: ${result.toJson()}}');
    final cognitoPlugin = Amplify.Auth.getPlugin(AmplifyAuthCognito.pluginKey);
    final session = await cognitoPlugin.fetchAuthSession();

    return UserDto(
        email: email,
        username: session.userPoolTokensResult.value.username,
        sub: session.userSubResult.value,
        idToken: session.userPoolTokensResult.value.idToken.raw,
        accessToken: session.userPoolTokensResult.value.accessToken.raw,
        refreshToken: session.userPoolTokensResult.value.refreshToken,
        emailVerified:
            session.userPoolTokensResult.value.idToken.emailVerified ?? false);
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
          idToken: session.userPoolTokensResult.value.idToken.raw,
          accessToken: session.userPoolTokensResult.value.accessToken.raw,
          refreshToken: session.userPoolTokensResult.value.refreshToken,
          emailVerified:
              session.userPoolTokensResult.value.idToken.emailVerified ??
                  false);
    } on AuthException catch (e) {
      logger.d('Error retrieving auth session: ${e.message}');
      throw Exception();
    }
  }

  @override
  Future<void> signUpEmail(
      {required String email,
      required String password,
      required String name,
      required bool isMaua}) async {
    final userAttributes = {
      AuthUserAttributeKey.email: email,
      AuthUserAttributeKey.name: name,
      const CognitoUserAttributeKey.custom('isMaua'): isMaua.toString()
    };
    await Amplify.Auth.signUp(
      username: email,
      password: password,
      options: SignUpOptions(
        userAttributes: userAttributes,
      ),
    );
  }

  @override
  Future<void> confirmSignUp(
      {required String email, required String code}) async {
    await Amplify.Auth.confirmSignUp(username: email, confirmationCode: code);
  }

  @override
  Future<void> resendConfirmationCode({required String email}) async {
    await Amplify.Auth.resendSignUpCode(username: email);
  }

  @override
  Future<void> confirmResetPassword(
      {required String email,
      required String code,
      required String newPassword}) async {
    await Amplify.Auth.confirmResetPassword(
        username: email, newPassword: newPassword, confirmationCode: code);
  }

  @override
  Future<void> resetPassword({required String email}) async {
    await Amplify.Auth.resetPassword(username: email);
  }

  @override
  Future<bool> checkEmailExists({required String email}) async {
    try {
      await Amplify.Auth.signUp(username: email, password: 'pwd');
      return false;
    } on UsernameExistsException catch (e) {
      logger.d(e.message);
      return true;
    } on InvalidParameterException catch (e) {
      logger.d(e.message);
      throw Exception();
    } on AuthException catch (e) {
      logger.d(e.message);
      return false;
    }
  }
}
