import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';
import 'package:auth_package/domain/usecases/get_logged_user.dart';
import 'package:auth_package/domain/usecases/logout.dart';
import 'package:mobx/mobx.dart';

import '../domain/entities/login_user_info.dart';
part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  final GetLoggedUser _getLoggedUser;
  final Logout _logout;
  final Logger logger = Modular.get();

  @observable
  LoggedUserInfo? user;

  AuthStoreBase(this._getLoggedUser, this._logout);

  @computed
  bool get isLogged => user != null;

  @action
  void setUser(LoggedUserInfo? value) => user = value;

  Future<void> signOut() async {
    final result = await _logout();
    result.fold((l) {
      logger.d('error on logout: ${l.message}');
    }, (r) {
      setUser(null);
      logger.d('logout success: $user');
    });
  }

  Future<bool> checkLogin() async {
    final result = await _getLoggedUser();
    return result.fold<bool>((l) {
      return false;
    }, (r) {
      setUser(r);
      return true;
    });
  }
}
