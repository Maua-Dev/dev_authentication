import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:auth_package/core/auth_store.dart';

class AuthGuard extends RouteGuard {
  AuthGuard({String? redirectTo}) : super(redirectTo: redirectTo ?? '/login');

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    return Modular.get<AuthStore>().isLogged;
  }
}
