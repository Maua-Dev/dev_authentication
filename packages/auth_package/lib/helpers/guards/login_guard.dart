import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';

import '../../core/auth_store.dart';

class LoginGuard extends RouteGuard {
  LoginGuard({String redirectTo = '/'}) : super(redirectTo: redirectTo);
  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    return !Modular.get<AuthStore>().isLogged;
  }
}
