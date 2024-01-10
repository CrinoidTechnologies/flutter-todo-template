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

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Enter Email`
  String get enterEmail {
    return Intl.message(
      'Enter Email',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter Password`
  String get enterPassword {
    return Intl.message(
      'Enter Password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Click here to sing up`
  String get clickHereToSingUp {
    return Intl.message(
      'Click here to sing up',
      name: 'clickHereToSingUp',
      desc: '',
      args: [],
    );
  }

  /// `Email cannot be empty`
  String get emailCannotBeEmpty {
    return Intl.message(
      'Email cannot be empty',
      name: 'emailCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Password cannot be empty`
  String get passwordCannotBeEmpty {
    return Intl.message(
      'Password cannot be empty',
      name: 'passwordCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Login Successful`
  String get loginSuccessful {
    return Intl.message(
      'Login Successful',
      name: 'loginSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `No User Found`
  String get noUserFound {
    return Intl.message(
      'No User Found',
      name: 'noUserFound',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Enter First Name`
  String get enterFirstName {
    return Intl.message(
      'Enter First Name',
      name: 'enterFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Last Name`
  String get enterLastName {
    return Intl.message(
      'Enter Last Name',
      name: 'enterLastName',
      desc: '',
      args: [],
    );
  }

  /// `Click here to Login.`
  String get clickHereToLogin {
    return Intl.message(
      'Click here to Login.',
      name: 'clickHereToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Please enter email`
  String get pleaseEnterEmail {
    return Intl.message(
      'Please enter email',
      name: 'pleaseEnterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter password`
  String get pleaseEnterPassword {
    return Intl.message(
      'Please enter password',
      name: 'pleaseEnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid email`
  String get pleaseEnterValidEmail {
    return Intl.message(
      'Please enter valid email',
      name: 'pleaseEnterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password must be with in 6-20 characters`
  String get passwordMustBeWithIn620Characters {
    return Intl.message(
      'Password must be with in 6-20 characters',
      name: 'passwordMustBeWithIn620Characters',
      desc: '',
      args: [],
    );
  }

  /// `Validation successful`
  String get validationSuccessful {
    return Intl.message(
      'Validation successful',
      name: 'validationSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your first name`
  String get pleaseEnterYourFirstName {
    return Intl.message(
      'Please enter your first name',
      name: 'pleaseEnterYourFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your last name`
  String get pleaseEnterYourLastName {
    return Intl.message(
      'Please enter your last name',
      name: 'pleaseEnterYourLastName',
      desc: '',
      args: [],
    );
  }

  /// `Add New Task`
  String get addNewTask {
    return Intl.message(
      'Add New Task',
      name: 'addNewTask',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `My Todo List`
  String get myTodoList {
    return Intl.message(
      'My Todo List',
      name: 'myTodoList',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get pending {
    return Intl.message(
      'Pending',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `Password must include at least one upper & lower case, one special character & one numeric digit.`
  String get passwordMustIncludeAtLeastOneUpperLowerCaseOne {
    return Intl.message(
      'Password must include at least one upper & lower case, one special character & one numeric digit.',
      name: 'passwordMustIncludeAtLeastOneUpperLowerCaseOne',
      desc: '',
      args: [],
    );
  }

  /// `Title cannot be empty`
  String get titleCannotBeEmpty {
    return Intl.message(
      'Title cannot be empty',
      name: 'titleCannotBeEmpty',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
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
