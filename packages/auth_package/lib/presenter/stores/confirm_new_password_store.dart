import 'package:auth_package/domain/entities/new_password.dart';
import 'package:auth_package/domain/usecases/confirm_new_password.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';
part 'confirm_new_password_store.g.dart';

class ConfirmNewPasswordStore = ConfirmNewPasswordStoreBase
    with _$ConfirmNewPasswordStore;

abstract class ConfirmNewPasswordStoreBase with Store {
  final Logger logger = Modular.get();
  final ConfirmNewPassword _confirmNewPassword;
  late final String? _email;
  ConfirmNewPasswordStoreBase(this._confirmNewPassword) {
    _email = Modular.args.data;
    if (_email == null) {
      Modular.to.navigate('/forgot-password/');
    }
  }
  @observable
  bool isObscureTextPassword = true;
  @action
  void setObscureTextPassword(bool value) => isObscureTextPassword = value;
  @observable
  bool isObscureTextConfirmPassword = true;
  @action
  void setObscureTextConfirmPassword(bool value) =>
      isObscureTextConfirmPassword = value;
  @observable
  bool isLoading = false;
  @action
  void setLoading(bool value) => isLoading = value;

  @observable
  String code = '';
  @action
  void setCode(String value) => code = value;

  @observable
  String newPassword = '';
  @action
  void setNewPassword(String value) => newPassword = value;
  @observable
  String confirmPassword = '';

  @action
  void setConfirmPassword(String value) => confirmPassword = value;
  @computed
  NewPassword get newPasswordModel => NewPassword(
      email: _email ?? '',
      code: code,
      newPassword: newPassword,
      confirmPassword: confirmPassword);

  Future<void> confirmNewPassword() async {
    try {
      if (!newPasswordModel.isValid) {
        return;
      }
      setLoading(true);
      await _confirmNewPassword(newPasswordModel);
      Modular.to.navigate('/login/');
    } catch (e) {
      logger.e(e);
    } finally {
      setLoading(false);
    }
  }
}
