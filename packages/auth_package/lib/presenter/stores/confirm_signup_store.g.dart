// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_signup_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConfirmSignupStore on ConfirmSignupStoreBase, Store {
  Computed<String>? _$emailComputed;

  @override
  String get email => (_$emailComputed ??= Computed<String>(() => super.email,
          name: 'ConfirmSignupStoreBase.email'))
      .value;

  late final _$timerAtom =
      Atom(name: 'ConfirmSignupStoreBase.timer', context: context);

  @override
  int get timer {
    _$timerAtom.reportRead();
    return super.timer;
  }

  @override
  set timer(int value) {
    _$timerAtom.reportWrite(value, super.timer, () {
      super.timer = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'ConfirmSignupStoreBase.isLoading', context: context);

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

  late final _$confirmedAtom =
      Atom(name: 'ConfirmSignupStoreBase.confirmed', context: context);

  @override
  bool get confirmed {
    _$confirmedAtom.reportRead();
    return super.confirmed;
  }

  @override
  set confirmed(bool value) {
    _$confirmedAtom.reportWrite(value, super.confirmed, () {
      super.confirmed = value;
    });
  }

  late final _$codeAtom =
      Atom(name: 'ConfirmSignupStoreBase.code', context: context);

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

  late final _$ConfirmSignupStoreBaseActionController =
      ActionController(name: 'ConfirmSignupStoreBase', context: context);

  @override
  void setTimer(int value) {
    final _$actionInfo = _$ConfirmSignupStoreBaseActionController.startAction(
        name: 'ConfirmSignupStoreBase.setTimer');
    try {
      return super.setTimer(value);
    } finally {
      _$ConfirmSignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCode(String value) {
    final _$actionInfo = _$ConfirmSignupStoreBaseActionController.startAction(
        name: 'ConfirmSignupStoreBase.setCode');
    try {
      return super.setCode(value);
    } finally {
      _$ConfirmSignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
timer: ${timer},
isLoading: ${isLoading},
confirmed: ${confirmed},
code: ${code},
email: ${email}
    ''';
  }
}
