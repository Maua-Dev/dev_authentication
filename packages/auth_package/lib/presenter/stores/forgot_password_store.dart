import 'package:auth_package/domain/usecases/reset_password.dart';
import 'package:mobx/mobx.dart';
import 'package:logger/logger.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'forgot_password_store.g.dart';

class ForgotPasswordStore = ForgotPasswordStoreBase with _$ForgotPasswordStore;

abstract class ForgotPasswordStoreBase with Store {
  final Logger logger = Modular.get();
  final ResetPassword _resetPassword;
  @observable
  bool isLoading = false;

  ForgotPasswordStoreBase(this._resetPassword);

  @action
  void setLoading(bool value) => isLoading = value;

  @observable
  String email = '';
  @action
  void setEmail(String value) => email = value;

  Future<void> resetPassword() async {
    try {
      setLoading(true);

      await _resetPassword(email: email);
      Modular.to.pushNamed('./new-password/', arguments: email);
    } catch (e) {
      logger.e(e);
    } finally {
      setLoading(false);
    }
  }
}
