import 'package:flutter_modular/flutter_modular.dart';
import 'package:auth_package/core/auth_store.dart';
import 'package:auth_package/domain/usecases/login_with_email.dart';
import 'package:auth_package/presenter/stores/login_store.dart';
import 'package:auth_package/presenter/ui/forgot_password_page.dart';
import 'package:auth_package/presenter/ui/logged_page.dart';
import 'package:auth_package/presenter/ui/login_page.dart';

import 'domain/repositories/login_repository.dart';
import 'helpers/guards/auth_guard.dart';

class MicroAppLoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<LoginWithEmail>(
        (i) => LoginWithEmailImpl(i<LoginRepository>())),
    Bind.lazySingleton((i) => LoginStore(i<LoginWithEmail>(), i<AuthStore>()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/logged',
        child: (_, __) => const LoggedPage(), guards: [AuthGuard()]),
    ChildRoute('/', child: (_, __) => const LoginPage()),
    ChildRoute('/forgot-password', child: (_, __) => const ForgotPasswordPage())
  ];
}
