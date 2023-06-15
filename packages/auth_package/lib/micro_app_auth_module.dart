import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';
import 'amplify/amplify_config.dart';
import 'core/auth_store.dart';
import 'domain/repositories/login_repository.dart';
import 'domain/usecases/get_logged_user.dart';
import 'domain/usecases/logout.dart';
import 'external/datasources/cognito_datasource.dart';
import 'infra/datasources/login_datasource.dart';
import 'infra/repositories/login_repository_impl.dart';

class MicroAppAuthModule extends Module {
  MicroAppAuthModule() {
    configureAmplify();
    Logger.level = Level.debug;
  }
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthStore(i(), i()), export: true),
    Bind.lazySingleton((i) => Logger(), export: true),
    Bind.factory<LoginDatasource>((i) => CognitoDatasource(), export: true),
    Bind.lazySingleton<LoginRepository>(
        (i) => LoginRepositoryImpl(i<LoginDatasource>()),
        export: true),
    Bind.lazySingleton<GetLoggedUser>(
        (i) => GetLoggedUserImpl(i<LoginRepository>()),
        export: true),
    Bind.lazySingleton<Logout>((i) => LogoutImpl(i<LoginRepository>()),
        export: true),
  ];
}
