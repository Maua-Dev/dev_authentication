import 'package:auth_package/domain/usecases/check_login_exists.dart';
import 'package:auth_package/domain/usecases/confirm_signup.dart';
import 'package:auth_package/domain/usecases/resend_confirmation_code.dart';
import 'package:auth_package/domain/usecases/reset_password.dart';
import 'package:auth_package/domain/usecases/signup_with_email.dart';
import 'package:auth_package/presenter/stores/confirm_signup_store.dart';
import 'package:auth_package/presenter/stores/forgot_password_store.dart';
import 'package:auth_package/presenter/stores/signup_store.dart';
import 'package:auth_package/presenter/ui/signup_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:auth_package/core/auth_store.dart';
import 'package:auth_package/domain/usecases/login_with_email.dart';
import 'package:auth_package/presenter/stores/login_store.dart';
import 'package:auth_package/presenter/ui/forgot_password_page.dart';

import 'package:auth_package/presenter/ui/login_page.dart';
import 'domain/repositories/login_repository.dart';

import 'presenter/ui/confirmation_code_page.dart';

class MicroAppLoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<CheckLoginExists>((i) => CheckLoginExistsImpl(i())),
    Bind.lazySingleton<ResetPassword>((i) => ResetPasswordImpl(i())),
    Bind.lazySingleton((i) => ForgotPasswordStore(i())),
    Bind.lazySingleton<SignupWithEmail>((i) => SignupWithEmailImpl(i())),
    Bind.lazySingleton((i) => SignupStore(i(), i())),
    Bind.lazySingleton<LoginWithEmail>(
        (i) => LoginWithEmailImpl(i<LoginRepository>())),
    Bind.lazySingleton((i) => LoginStore(i<LoginWithEmail>(), i<AuthStore>())),
    Bind.lazySingleton<ConfirmSignup>((i) => ConfirmSignupImpl(i())),
    Bind.lazySingleton<ResendConfirmationCode>(
        (i) => ResendConfirmationCodeImpl(i())),
    Bind.factory((i) => ConfirmSignupStore(i(), i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => const LoginPage()),
    ChildRoute('/new',
        child: (_, __) => const SignUpPage(),
        transition: TransitionType.rightToLeftWithFade),
    ChildRoute('/confirm',
        child: (_, __) => const ConfirmationCodePage(),
        transition: TransitionType.rightToLeftWithFade),
    ChildRoute('/forgot-password', child: (_, __) => const ForgotPasswordPage())
  ];
}
