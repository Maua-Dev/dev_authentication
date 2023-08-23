// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_new_password_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConfirmNewPasswordStore on ConfirmNewPasswordStoreBase, Store {
  Computed<NewPassword>? _$newPasswordModelComputed;

  @override
  NewPassword get newPasswordModel => (_$newPasswordModelComputed ??=
          Computed<NewPassword>(() => super.newPasswordModel,
              name: 'ConfirmNewPasswordStoreBase.newPasswordModel'))
      .value;

  late final _$isObscureTextPasswordAtom = Atom(
      name: 'ConfirmNewPasswordStoreBase.isObscureTextPassword',
      context: context);

  @override
  bool get isObscureTextPassword {
    _$isObscureTextPasswordAtom.reportRead();
    return super.isObscureTextPassword;
  }

  @override
  set isObscureTextPassword(bool value) {
    _$isObscureTextPasswordAtom.reportWrite(value, super.isObscureTextPassword,
        () {
      super.isObscureTextPassword = value;
    });
  }

  late final _$isObscureTextConfirmPasswordAtom = Atom(
      name: 'ConfirmNewPasswordStoreBase.isObscureTextConfirmPassword',
      context: context);

  @override
  bool get isObscureTextConfirmPassword {
    _$isObscureTextConfirmPasswordAtom.reportRead();
    return super.isObscureTextConfirmPassword;
  }

  @override
  set isObscureTextConfirmPassword(bool value) {
    _$isObscureTextConfirmPasswordAtom
        .reportWrite(value, super.isObscureTextConfirmPassword, () {
      super.isObscureTextConfirmPassword = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'ConfirmNewPasswordStoreBase.isLoading', context: context);

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

  late final _$codeAtom =
      Atom(name: 'ConfirmNewPasswordStoreBase.code', context: context);

  @override
  String get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  late final _$newPasswordAtom =
      Atom(name: 'ConfirmNewPasswordStoreBase.newPassword', context: context);

  @override
  String get newPassword {
    _$newPasswordAtom.reportRead();
    return super.newPassword;
  }

  @override
  set newPassword(String value) {
    _$newPasswordAtom.reportWrite(value, super.newPassword, () {
      super.newPassword = value;
    });
  }

  late final _$confirmPasswordAtom = Atom(
      name: 'ConfirmNewPasswordStoreBase.confirmPassword', context: context);

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

  late final _$ConfirmNewPasswordStoreBaseActionController =
      ActionController(name: 'ConfirmNewPasswordStoreBase', context: context);

  @override
  void setObscureTextPassword(bool value) {
    final _$actionInfo =
        _$ConfirmNewPasswordStoreBaseActionController.startAction(
            name: 'ConfirmNewPasswordStoreBase.setObscureTextPassword');
    try {
      return super.setObscureTextPassword(value);
    } finally {
      _$ConfirmNewPasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObscureTextConfirmPassword(bool value) {
    final _$actionInfo =
        _$ConfirmNewPasswordStoreBaseActionController.startAction(
            name: 'ConfirmNewPasswordStoreBase.setObscureTextConfirmPassword');
    try {
      return super.setObscureTextConfirmPassword(value);
    } finally {
      _$ConfirmNewPasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$ConfirmNewPasswordStoreBaseActionController
        .startAction(name: 'ConfirmNewPasswordStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$ConfirmNewPasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCode(String value) {
    final _$actionInfo = _$ConfirmNewPasswordStoreBaseActionController
        .startAction(name: 'ConfirmNewPasswordStoreBase.setCode');
    try {
      return super.setCode(value);
    } finally {
      _$ConfirmNewPasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNewPassword(String value) {
    final _$actionInfo = _$ConfirmNewPasswordStoreBaseActionController
        .startAction(name: 'ConfirmNewPasswordStoreBase.setNewPassword');
    try {
      return super.setNewPassword(value);
    } finally {
      _$ConfirmNewPasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String value) {
    final _$actionInfo = _$ConfirmNewPasswordStoreBaseActionController
        .startAction(name: 'ConfirmNewPasswordStoreBase.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$ConfirmNewPasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isObscureTextPassword: ${isObscureTextPassword},
isObscureTextConfirmPassword: ${isObscureTextConfirmPassword},
isLoading: ${isLoading},
code: ${code},
newPassword: ${newPassword},
confirmPassword: ${confirmPassword},
newPasswordModel: ${newPasswordModel}
    ''';
  }
}
