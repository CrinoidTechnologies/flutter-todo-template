import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_template_app/generated/l10n.dart';
import 'package:flutter_todo_template_app/screens/home_screen.dart';
import 'package:flutter_todo_template_app/screens/login_screen.dart';
import 'package:flutter_todo_template_app/screens/signup_screen.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_todo_template_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Signup attempt with empty first name',
      (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.byType(LoginScreen), findsOneWidget);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('btn_sign_up')));
    await tester.pumpAndSettle();
    expect(find.byType(SignupScreen), findsOneWidget);
    await tester.pumpAndSettle();
    await tester.enterText(find.byKey(Key('txt_last_name')), 'Last name');

    await tester.enterText(find.byKey(Key('txt_email')), 'test@gmail.com');

    await tester.enterText(find.byKey(Key('txt_password')), '@As4ffff');

    await tester.tap(find.byKey(Key('btn_signup')));

    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 2));

    expect(find.text(S.current.pleaseEnterYourFirstName), findsOneWidget);
  });

  testWidgets('Signup attempt with empty last name',
      (WidgetTester tester) async {
    app.main();
    // await tester.pumpAndSettle();
    //
    // expect(find.byType(LoginScreen), findsOneWidget);
    // await tester.pumpAndSettle();
    // await tester.tap(find.byKey(Key('btn_sign_up')));
    await tester.pumpAndSettle();
    expect(find.byType(SignupScreen), findsOneWidget);

    await tester.enterText(find.byKey(Key('txt_first_name')), 'First name');

    await tester.enterText(find.byKey(Key('txt_email')), 'test@gmail.com');

    await tester.enterText(find.byKey(Key('txt_password')), '@As4ffff');

    Finder signupBtn = find.byKey(Key('btn_signup'));
    await tester.tap(signupBtn);
    await tester.pumpAndSettle();

    expect(find.text(S.current.pleaseEnterYourLastName), findsOneWidget);
  });

  testWidgets('Signup attempt with empty email', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.byType(LoginScreen), findsOneWidget);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('btn_sign_up')));
    await tester.pumpAndSettle();
    expect(find.byType(SignupScreen), findsOneWidget);

    await tester.enterText(find.byKey(Key('txt_first_name')), 'First name');

    await tester.enterText(find.byKey(Key('txt_last_name')), 'Last name');

    await tester.enterText(find.byKey(Key('txt_password')), '@As4ffff');

    await tester.tap(find.byKey(Key('btn_signup')));

    await tester.pumpAndSettle();

    expect(find.text(S.current.pleaseEnterEmail), findsOneWidget);
  });

  testWidgets('Signup attempt with empty password',
      (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.byType(LoginScreen), findsOneWidget);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('btn_sign_up')));
    await tester.pumpAndSettle();
    expect(find.byType(SignupScreen), findsOneWidget);

    await tester.enterText(find.byKey(Key('txt_first_name')), 'First name');

    await tester.enterText(find.byKey(Key('txt_last_name')), 'Last name');

    await tester.enterText(find.byKey(Key('txt_email')), 'test@gmail.com');

    await tester.tap(find.byKey(Key('btn_signup')));

    await tester.pumpAndSettle();

    expect(find.text(S.current.pleaseEnterPassword), findsOneWidget);
  });

  testWidgets('Signup attempt with invalid email', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.byType(LoginScreen), findsOneWidget);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('btn_sign_up')));
    await tester.pumpAndSettle();
    expect(find.byType(SignupScreen), findsOneWidget);

    await tester.enterText(find.byKey(Key('txt_first_name')), 'First name');

    await tester.enterText(find.byKey(Key('txt_last_name')), 'Last name');

    await tester.enterText(find.byKey(Key('txt_email')), 'test@gmail');

    await tester.enterText(find.byKey(Key('txt_password')), '@As4ffff');

    await tester.tap(find.byKey(Key('btn_signup')));

    await tester.pumpAndSettle();

    expect(find.text(S.current.pleaseEnterValidEmail), findsOneWidget);
  });

  testWidgets('Signup attempt with invalid password',
      (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.byType(LoginScreen), findsOneWidget);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('btn_sign_up')));
    await tester.pumpAndSettle();
    expect(find.byType(SignupScreen), findsOneWidget);

    await tester.enterText(find.byKey(Key('txt_first_name')), 'First name');

    await tester.enterText(find.byKey(Key('txt_last_name')), 'Last name');

    await tester.enterText(find.byKey(Key('txt_email')), 'test@gmail.com');

    await tester.enterText(find.byKey(Key('txt_password')), '@As4');

    await tester.tap(find.byKey(Key('btn_signup')));

    await tester.pumpAndSettle();

    expect(
        find.text(S.current.passwordMustBeWithIn620Characters), findsOneWidget);
  });

  testWidgets('Signup attempt with valid credentials',
      (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.byType(LoginScreen), findsOneWidget);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('btn_sign_up')));
    await tester.pumpAndSettle();
    expect(find.byType(SignupScreen), findsOneWidget);

    await tester.enterText(find.byKey(Key('txt_first_name')), 'First name');

    await tester.enterText(find.byKey(Key('txt_last_name')), 'Last name');

    await tester.enterText(find.byKey(Key('txt_email')), 'test@gmail.com');

    await tester.enterText(find.byKey(Key('txt_password')), '@As4sssss');

    await tester.tap(find.byKey(Key('btn_signup')));

    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);
  });
}
