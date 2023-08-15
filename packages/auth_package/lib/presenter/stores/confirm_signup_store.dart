import 'dart:async';

import 'package:auth_package/domain/usecases/confirm_signup.dart';
import 'package:auth_package/domain/usecases/resend_confirmation_code.dart';
import 'package:auth_package/helpers/functions/toast_message.dart';
import 'package:mobx/mobx.dart';
import 'package:logger/logger.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'confirm_signup_store.g.dart';

class ConfirmSignupStore = ConfirmSignupStoreBase with _$ConfirmSignupStore;

abstract class ConfirmSignupStoreBase with Store {
  final ConfirmSignup _confirmSignup;
  final ResendConfirmationCode _resendConfirmationCode;
  final Logger logger = Modular.get();
  late final String? _email;
  Timer? _timer;
  ConfirmSignupStoreBase(this._confirmSignup, this._resendConfirmationCode) {
    logger.d('Data: ${Modular.args.data}');
    _email = Modular.args.data;
    if (_email == null) {
      Modular.to.navigate('/login/');
    } else {
      startTimer();
    }
  }

  @observable
  int timer = 100;
  @action
  void setTimer(int value) => timer = value;
  @computed
  String get email => _email ?? '';
  @observable
  bool isLoading = false;
  @observable
  bool confirmed = false;
  @observable
  String code = '';

  @action
  void setCode(String value) => code = value;

  Future<void> confirm() async {
    isLoading = true;
    final result = await _confirmSignup(email: email, code: code);
    isLoading = false;
    result.fold((e) async {
      logger.e(e.message);
      await showToast(e.message);
    }, (r) async {
      logger.i('User confirmed');
      confirmed = true;
    });
  }

  Future<void> resendCode() async {
    isLoading = true;
    final result = await _resendConfirmationCode(email: email);
    isLoading = false;
    result.fold((e) async {
      logger.e(e.message);
      await showToast(e.message);
    }, (r) async {
      logger.i('Code resent');
      await showToast('Code resent');
    });
  }

  void goLogin() {
    Modular.to.navigate('/login/');
  }

  startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (timer == 0) {
        stopTimer();
        return;
      }
      setTimer(timer - 1);
    });
  }

  stopTimer() {
    _timer?.cancel();
  }
}
