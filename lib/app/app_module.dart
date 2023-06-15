import 'package:auth_package/login.dart';
import 'package:dev_authentication/app/home/domain/repositories/uri_repository.dart';
import 'package:dev_authentication/app/home/domain/usecases/get_params.dart';
import 'package:dev_authentication/app/home/domain/usecases/set_params.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home/infra/repositories/uri_repository_impl.dart';
import 'home/presenter/pages/home_page.dart';
import 'home/presenter/stores/home_store.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [MicroAppAuthModule()];

  @override
  List<Bind<Object>> get binds => [
        Bind.singleton<UriRepository>((i) => UriRepositoryImpl()),
        Bind.lazySingleton<GetParams>((i) => GetParamsImpl(i())),
        Bind.lazySingleton<SetParams>((i) => SetParamsImpl(i())),
        Bind.factory((i) => HomeStore(i(), i(), i(), i()))
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ModuleRoute('/login',
            module: MicroAppLoginModule(), guards: [LoginGuard()]),
      ];
}
