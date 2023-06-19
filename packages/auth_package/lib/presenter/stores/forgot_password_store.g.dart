// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ForgotPasswordStore on ForgotPasswordStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'ForgotPasswordStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'ForgotPasswordStoreBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$ForgotPasswordStoreBaseActionController =
      ActionController(name: 'ForgotPasswordStoreBase', context: context);

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$ForgotPasswordStoreBaseActionController.startAction(
        name: 'ForgotPasswordStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$ForgotPasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$ForgotPasswordStoreBaseActionController.startAction(
        name: 'ForgotPasswordStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$ForgotPasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
email: ${email}
    ''';
  }
}
