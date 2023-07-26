// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignupStore on SignupStoreBase, Store {
  Computed<int>? _$getIndexPageComputed;

  @override
  int get getIndexPage =>
      (_$getIndexPageComputed ??= Computed<int>(() => super.getIndexPage,
              name: 'SignupStoreBase.getIndexPage'))
          .value;
  Computed<bool>? _$isEmailMauaComputed;

  @override
  bool get isEmailMaua =>
      (_$isEmailMauaComputed ??= Computed<bool>(() => super.isEmailMaua,
              name: 'SignupStoreBase.isEmailMaua'))
          .value;
  Computed<bool>? _$isPasswordEqualsComputed;

  @override
  bool get isPasswordEquals => (_$isPasswordEqualsComputed ??= Computed<bool>(
          () => super.isPasswordEquals,
          name: 'SignupStoreBase.isPasswordEquals'))
      .value;
  Computed<SignUpCredential>? _$credentialComputed;

  @override
  SignUpCredential get credential => (_$credentialComputed ??=
          Computed<SignUpCredential>(() => super.credential,
              name: 'SignupStoreBase.credential'))
      .value;
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??=
          Computed<bool>(() => super.isValid, name: 'SignupStoreBase.isValid'))
      .value;

  late final _$_selectedPageAtom =
      Atom(name: 'SignupStoreBase._selectedPage', context: context);

  @override
  int get _selectedPage {
    _$_selectedPageAtom.reportRead();
    return super._selectedPage;
  }

  @override
  set _selectedPage(int value) {
    _$_selectedPageAtom.reportWrite(value, super._selectedPage, () {
      super._selectedPage = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'SignupStoreBase.isLoading', context: context);

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
      Atom(name: 'SignupStoreBase.email', context: context);

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

  late final _$passwordAtom =
      Atom(name: 'SignupStoreBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$confirmPasswordAtom =
      Atom(name: 'SignupStoreBase.confirmPassword', context: context);

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$nameAtom = Atom(name: 'SignupStoreBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$isMauaAtom =
      Atom(name: 'SignupStoreBase.isMaua', context: context);

  @override
  bool get isMaua {
    _$isMauaAtom.reportRead();
    return super.isMaua;
  }

  @override
  set isMaua(bool value) {
    _$isMauaAtom.reportWrite(value, super.isMaua, () {
      super.isMaua = value;
    });
  }

  late final _$SignupStoreBaseActionController =
      ActionController(name: 'SignupStoreBase', context: context);

  @override
  void pageChanged(int index) {
    final _$actionInfo = _$SignupStoreBaseActionController.startAction(
        name: 'SignupStoreBase.pageChanged');
    try {
      return super.pageChanged(index);
    } finally {
      _$SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$SignupStoreBaseActionController.startAction(
        name: 'SignupStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$SignupStoreBaseActionController.startAction(
        name: 'SignupStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String value) {
    final _$actionInfo = _$SignupStoreBaseActionController.startAction(
        name: 'SignupStoreBase.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$SignupStoreBaseActionController.startAction(
        name: 'SignupStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsMaua(bool value) {
    final _$actionInfo = _$SignupStoreBaseActionController.startAction(
        name: 'SignupStoreBase.setIsMaua');
    try {
      return super.setIsMaua(value);
    } finally {
      _$SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
email: ${email},
password: ${password},
confirmPassword: ${confirmPassword},
name: ${name},
isMaua: ${isMaua},
getIndexPage: ${getIndexPage},
isEmailMaua: ${isEmailMaua},
isPasswordEquals: ${isPasswordEquals},
credential: ${credential},
isValid: ${isValid}
    ''';
  }
}
