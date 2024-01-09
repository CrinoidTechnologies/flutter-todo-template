import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_template_app/screens/create_task_screen.dart';
import 'package:flutter_todo_template_app/screens/home_screen.dart';
import 'package:flutter_todo_template_app/screens/login_screen.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_todo_template_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
      'Login attempt with valid credentials & creating a new task successfully',
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

    Finder btnCreateNewTask = find.byKey(Key('btn_add_new_task'));
    await tester.tap(btnCreateNewTask);

    expect(find.byType(HomeScreen), CreateTaskScreen);
    await tester.pumpAndSettle();

    Finder titleInputTxt = find.byKey(Key('txt_title'));
    await tester.enterText(titleInputTxt, 'This is test title');

    Finder btnCreateTask = find.byKey(Key('btn_create_task'));
    await tester.tap(btnCreateTask);

    expect(find.byType(HomeScreen), HomeScreen);
    await tester.pumpAndSettle();

    expect(find.text('This is test title'), findsOneWidget);
  });
}
