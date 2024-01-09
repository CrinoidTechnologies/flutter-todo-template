import 'package:flutter_todo_template_app/config/routes/routes_location.dart';
import 'package:flutter_todo_template_app/config/routes/routes_provider.dart';
import 'package:go_router/go_router.dart';

import '../../screens/create_task_screen.dart';
import '../../screens/home_screen.dart';
import '../../screens/login_screen.dart';
import '../../screens/signup_screen.dart';

final appRoutes = [
  GoRoute(
    path: RouteLocation.login,
    parentNavigatorKey: navigationKey,
    builder: LoginScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.signup,
    parentNavigatorKey: navigationKey,
    builder: SignupScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.home,
    parentNavigatorKey: navigationKey,
    builder: HomeScreen.builder,
  ),
  GoRoute(
    path: RouteLocation.createTask,
    parentNavigatorKey: navigationKey,
    builder: CreateTaskScreen.builder,
  ),
];
