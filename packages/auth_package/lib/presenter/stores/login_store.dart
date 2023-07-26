import 'dart:async';

import 'package:auth_package/domain/errors/errors.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';
import 'package:auth_package/core/auth_store.dart';
import 'package:auth_package/domain/entities/login_credential.dart';
import 'package:auth_package/domain/usecases/login_with_email.dart';
import 'package:mobx/mobx.dart';

import '../../helpers/functions/toast_message.dart';
part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  final LoginWithEmail _loginWithEmail;
  final Logger logger = Modular.get();
  final AuthStore _authStore;
  LoginStoreBase(this._loginWithEmail, this._authStore) {
    logger.d('authStore.isLogged: ${_authStore.isLogged}');
    if (_authStore.isLogged) Modular.to.navigate('/logged');
  }

  @observable
  bool isLoading = false;

  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = '';

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get isValid => credential.isValidEmail && credential.isValidPassword;

  @computed
  LoginCredential get credential =>
      LoginCredential.withEmailAndPassword(email: email, password: password);

  Future<void> loginEmail() async {
    isLoading = true;
    final user = await _loginWithEmail(credential);
    isLoading = false;
    user.fold((e) async {
      logger.e(e.message);
      await showToast(e.message);
      if (e is ErrorEmailNotVerified) {
        Modular.to.pushNamed('./confirm', arguments: credential.email);
      } else if (e is ErrorPasswordNotReset) {
        logger.i('Password not reset');
      }
    }, (user) {
      _authStore.setUser(user);
      Modular.to.navigate('/');
    });
  }
}
