import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_template_app/generated/l10n.dart';
import 'package:flutter_todo_template_app/screens/home_screen.dart';
import 'package:flutter_todo_template_app/screens/login_screen.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_todo_template_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Login attempt with empty email', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.byType(LoginScreen), findsOneWidget);
    await tester.pumpAndSettle();

    Finder emailInputTxt = find.byKey(Key('txt_email'));
    await tester.enterText(emailInputTxt, '');

    Finder passwordInputTxt = find.byKey(Key('txt_password'));
    await tester.enterText(passwordInputTxt, '@4Adddd');

    Finder loginButton = find.byKey(Key('btn_login'));
    await tester.tap(loginButton);

    await tester.pumpAndSettle();

    expect(find.text(S.current.pleaseEnterEmail), findsOneWidget);
  });

  testWidgets('Login attempt with empty password', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.byType(LoginScreen), findsOneWidget);
    await tester.pumpAndSettle();

    Finder emailInputTxt = find.byKey(Key('txt_email'));
    await tester.enterText(emailInputTxt, 'test@gmail.com');

    Finder passwordInputTxt = find.byKey(Key('txt_password'));
    await tester.enterText(passwordInputTxt, '');

    Finder loginButton = find.byKey(Key('btn_login'));
    await tester.tap(loginButton);

    await tester.pumpAndSettle();

    expect(find.text(S.current.pleaseEnterPassword), findsOneWidget);
  });

  testWidgets('Login attempt with invalid email', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.byType(LoginScreen), findsOneWidget);
    await tester.pumpAndSettle();

    Finder emailInputTxt = find.byKey(Key('txt_email'));
    await tester.enterText(emailInputTxt, 'test@gmail');

    Finder passwordInputTxt = find.byKey(Key('txt_password'));
    await tester.enterText(passwordInputTxt, '@4Adddd');

    Finder loginButton = find.byKey(Key('btn_login'));
    await tester.tap(loginButton);

    await tester.pumpAndSettle();

    expect(find.text(S.current.pleaseEnterValidEmail), findsOneWidget);
  });

  testWidgets('Login attempt with invalid password',
      (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.byType(LoginScreen), findsOneWidget);
    await tester.pumpAndSettle();

    Finder emailInputTxt = find.byKey(Key('txt_email'));
    await tester.enterText(emailInputTxt, 'test@gmail.com');

    Finder passwordInputTxt = find.byKey(Key('txt_password'));
    await tester.enterText(passwordInputTxt, '@4Ad');

    Finder loginButton = find.byKey(Key('btn_login'));
    await tester.tap(loginButton);

    await tester.pumpAndSettle();

    expect(
        find.text(S.current.passwordMustBeWithIn620Characters), findsOneWidget);
  });

  testWidgets('Login attempt with valid credentials',
      (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.byType(LoginScreen), findsOneWidget);
    await tester.pumpAndSettle();

    Finder emailInputTxt = find.byKey(Key('txt_email'));
    await tester.enterText(emailInputTxt, 'test001@gmail.com');

    Finder passwordInputTxt = find.byKey(Key('txt_password'));
    await tester.enterText(passwordInputTxt, 'Qwerty@1');

    Finder loginButton = find.byKey(Key('btn_login'));
    await tester.tap(loginButton);

    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);
  });
}
