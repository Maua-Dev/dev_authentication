// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on AuthStoreBase, Store {
  Computed<bool>? _$isLoggedComputed;

  @override
  bool get isLogged => (_$isLoggedComputed ??=
          Computed<bool>(() => super.isLogged, name: 'AuthStoreBase.isLogged'))
      .value;

  late final _$userAtom = Atom(name: 'AuthStoreBase.user', context: context);

  @override
  LoggedUserInfo? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(LoggedUserInfo? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$AuthStoreBaseActionController =
      ActionController(name: 'AuthStoreBase', context: context);

  @override
  void setUser(LoggedUserInfo? value) {
    final _$actionInfo = _$AuthStoreBaseActionController.startAction(
        name: 'AuthStoreBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
isLogged: ${isLogged}
    ''';
  }
}
