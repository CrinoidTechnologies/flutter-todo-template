import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_template_app/utils/extensions.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../config/routes/routes_location.dart';
import '../data/models/profile.dart';
import '../generated/l10n.dart';
import '../providers/login/login_status_provider.dart';
import '../providers/login/profile_entity_provider.dart';
import '../providers/profile/profile_provider.dart';
import '../utils/app_alerts.dart';
import '../widgets/common_text_field.dart';
import '../widgets/display_white_text.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static LoginScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const LoginScreen();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var loginStatus = ref.watch(loginStatusProvider);
    final colors = context.colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        title: DisplayWhiteText(
          text: S.of(context).login,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommonTextField(
                txtFieldKey: const Key('txt_email'),
                hintText: S.of(context).enterEmail,
                title: S.of(context).enterEmail,
                controller: _emailController,
              ),
              const Gap(30),
              CommonTextField(
                txtFieldKey: const Key('txt_password'),
                hintText: S.of(context).enterPassword,
                title: S.of(context).enterPassword,
                controller: _passwordController,
              ),
              const Gap(30),
              Text(
                loginStatus,
                style: context.textTheme.bodyMedium,
              ),
              const Gap(30),
              ElevatedButton(
                key: const Key('btn_login'),
                onPressed: _onLogin,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DisplayWhiteText(
                    text: S.of(context).login,
                  ),
                ),
              ),
              const Gap(30),
              InkWell(
                key: const Key('btn_sign_up'),
                onTap: () {
                  context.pushReplacement(RouteLocation.signup);
                },
                child: Text(
                  S.of(context).clickHereToSingUp,
                  style: context.textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onLogin() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final data = Profile(
      email: email,
      password: password,
    );
    ref.read(profileEntityProvider.notifier).state = data;
    ref.read(loginStatusProvider.notifier).validate();
    var result = ref.watch(loginStatusProvider);

    // var result = LoginValidator(profile: data).validate();

    if (result == S.current.validationSuccessful) {
      await ref.read(profileProvider.notifier).getUser(data).then((value) {
        // print('onlogin -> ${value?.email}');
        if (value != null) {
          // AppAlerts.displaySnackbar(context, S.of(context).loginSuccessful);
          context.pushReplacement(RouteLocation.home);
        } else {
          AppAlerts.displaySnackbar(context, S.of(context).noUserFound);
        }
      });
    } else {
      // AppAlerts.displaySnackbar(context, result);
    }
  }
}
