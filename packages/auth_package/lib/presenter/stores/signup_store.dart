import 'package:auth_package/domain/entities/signup_credential.dart';
import 'package:auth_package/domain/usecases/check_login_exists.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';

import '../../domain/usecases/signup_with_email.dart';
import '../../helpers/functions/toast_message.dart';
part 'signup_store.g.dart';

class SignupStore = SignupStoreBase with _$SignupStore;

abstract class SignupStoreBase extends PageController with Store {
  final Logger logger = Modular.get();
  final SignupWithEmail _signupWithEmail;
  final CheckLoginExists _checkLoginExists;
  @observable
  int _selectedPage = 0;

  @override
  int get initialPage => 0;

  @override
  bool get keepPage => true;

  @computed
  int get getIndexPage => _selectedPage;
  @action
  void pageChanged(int index) {
    if (index == 0 && _selectedPage == 1) setEmail('');
    if (index < 3) _selectedPage = index;
  }

  @observable
  bool isLoading = false;

  @observable
  String email = '';

  SignupStoreBase(this._signupWithEmail, this._checkLoginExists);

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get isEmailMaua => email.contains('@maua.br');

  @observable
  String password = '';

  @action
  void setPassword(String value) => password = value;

  @observable
  String confirmPassword = '';

  @action
  void setConfirmPassword(String value) => confirmPassword = value;

  @computed
  bool get isPasswordEquals => password == confirmPassword;

  @observable
  String name = '';

  @action
  void setName(String value) => name = value;

  @observable
  bool isMaua = false;

  @action
  void setIsMaua(bool value) => isMaua = value;

  @computed
  SignUpCredential get credential => SignUpCredential.withEmailAndPassword(
      email: email, password: password, name: name, isMaua: isMaua);

  @computed
  bool get isValid =>
      credential.isValidEmail &&
      credential.isValidPassword &&
      credential.isValidName;

  Future<void> signUp() async {
    isLoading = true;
    final result = await _signupWithEmail(credential);
    isLoading = false;
    result.fold((e) async {
      logger.e(e.message);
      await showToast(e.message);
    }, (r) {
      Modular.to.navigate('./confirm', arguments: credential.email);
    });
  }

  Future<bool> checkLogin() async {
    final result = await _checkLoginExists(email: credential.email);
    return result.fold((l) async {
      logger.e(l.message);
      await showToast(l.message);
      return false;
    }, (r) {
      logger.i(r);
      return true;
    });
  }
}
