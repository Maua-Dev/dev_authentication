import 'package:auth_package/domain/entities/signup_credential.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';

import '../../domain/usecases/signup_with_email.dart';
import '../../helpers/functions/toast_message.dart';
part 'signup_store.g.dart';

class SignupStore = SignupStoreBase with _$SignupStore;

abstract class SignupStoreBase with Store {
  final Logger logger = Modular.get();
  final SignupWithEmail _signupWithEmail;

  @observable
  bool isLoading = false;

  @observable
  String email = '';

  SignupStoreBase(this._signupWithEmail);

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = '';

  @action
  void setPassword(String value) => password = value;

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
      Modular.to.navigate('/confirm/');
    });
  }
}
