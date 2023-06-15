// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sign In as`
  String get buttonLogin {
    return Intl.message(
      'Sign In as',
      name: 'buttonLogin',
      desc: '',
      args: [],
    );
  }

  /// `Sign in as a different user?`
  String get buttonLoginDiffUser {
    return Intl.message(
      'Sign in as a different user?',
      name: 'buttonLoginDiffUser',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get hintPassword {
    return Intl.message(
      'Password',
      name: 'hintPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get textForgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'textForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get textRegister {
    return Intl.message(
      'Register',
      name: 'textRegister',
      desc: '',
      args: [],
    );
  }

  /// `An error was found in the parameters, following parameters are required: `
  String get textErrorHome {
    return Intl.message(
      'An error was found in the parameters, following parameters are required: ',
      name: 'textErrorHome',
      desc: '',
      args: [],
    );
  }

  /// `{textSubErrorHome} `
  String textSubErrorHome(Object placeholders, Object textSubErrorHome) {
    return Intl.message(
      '$textSubErrorHome ',
      name: 'textSubErrorHome',
      desc: '',
      args: [placeholders, textSubErrorHome],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
