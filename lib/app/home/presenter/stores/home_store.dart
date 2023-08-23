import 'package:auth_package/core/auth_store.dart';
import 'package:auth_package/domain/entities/login_user_info.dart';
import 'package:dev_authentication/app/home/domain/entities/params.dart';
import 'package:dev_authentication/app/home/domain/usecases/get_params.dart';
import 'package:dev_authentication/app/home/domain/usecases/set_params.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher_string.dart';
part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final GetParams _getParams;
  final SetParams _setParams;
  final Logger logger;
  final AuthStore _authStore;
  HomeStoreBase(
      this._getParams, this.logger, this._authStore, this._setParams) {
    if (Modular.args.uri.toString().contains('/?')) {
      final result = _setParams(Modular.args.uri);
      result.fold((l) => logger.i(l.message), (r) => null);
    }
    checkParams();
    _authStore
        .checkLogin()
        .then((value) => !value ? Modular.to.pushNamed('/login/') : null);
  }

  @observable
  Params? params;

  @observable
  String? error;

  @computed
  LoggedUserInfo? get user => _authStore.user;

  @computed
  bool get hasError => error != null;

  void checkParams() {
    final result = _getParams();
    result.fold((l) {
      error = l.message;
      params = null;
      logger.i('Error: $error');
    }, (r) {
      params = r;
      error = null;
      logger.i('Params: $params');
    });
  }

  void signIn() {
    launchUrlString(
        '${params!.redirectUri}/#id_token=${_authStore.user?.idToken}&access_token=${_authStore.user?.accessToken}&refresh_token=${_authStore.user?.refreshToken}&token_type=Bearer',
        webOnlyWindowName: '_self');
  }

  Future<void> signInDiffUser() async {
    await _authStore.signOut();
    Modular.to.navigate('/login');
  }
}
