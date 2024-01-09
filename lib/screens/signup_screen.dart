import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_template_app/utils/extensions.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../config/routes/routes_location.dart';
import '../data/models/profile.dart';
import '../generated/l10n.dart';
import '../providers/profile/profile_provider.dart';
import '../providers/signup/signup_profile_entity_provider.dart';
import '../providers/signup/signup_status_provider.dart';
import '../utils/app_alerts.dart';
import '../widgets/common_text_field.dart';
import '../widgets/display_white_text.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  static SignupScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const SignupScreen();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignupScreen> {
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    var signUpStatus = ref.watch(signUpStatusProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        title: DisplayWhiteText(
          text: S.of(context).signUp,
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
                txtFieldKey: Key('txt_first_name'),
                hintText: S.of(context).enterFirstName,
                title: S.of(context).enterFirstName,
                controller: _firstNameController,
              ),
              const Gap(30),
              CommonTextField(
                txtFieldKey: Key('txt_last_name'),
                hintText: S.of(context).enterLastName,
                title: S.of(context).enterLastName,
                controller: _lastNameController,
              ),
              const Gap(30),
              CommonTextField(
                txtFieldKey: Key('txt_email'),
                hintText: S.of(context).enterEmail,
                title: S.of(context).enterEmail,
                controller: _emailController,
              ),
              const Gap(30),
              CommonTextField(
                txtFieldKey: Key('txt_password'),
                hintText: S.of(context).enterPassword,
                title: S.of(context).enterPassword,
                controller: _passwordController,
              ),
              const Gap(30),
              Text(
                signUpStatus,
                style: context.textTheme.bodyMedium,
              ),
              const Gap(30),
              ElevatedButton(
                key: Key('btn_signup'),
                onPressed: _onSignUp,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: DisplayWhiteText(
                    text: S.of(context).signUp,
                  ),
                ),
              ),
              const Gap(30),
              InkWell(
                onTap: () {
                  context.pushReplacement(RouteLocation.login);
                },
                child: Text(
                  S.of(context).clickHereToLogin,
                  style: context.textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSignUp() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();

    final data = Profile(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
    );

    ref.read(signUpProfileEntityProvider.notifier).state = data;
    ref.read(signUpStatusProvider.notifier).validate();
    var result = ref.watch(signUpStatusProvider);

    if (result == S.current.validationSuccessful) {
      await ref
          .read(profileProvider.notifier)
          .createNewUser(data)
          .then((value) {
        if (value) {
          // AppAlerts.displaySnackbar(context, 'Sign Up Successful');
          context.pushReplacement(RouteLocation.home);
        } else {
          AppAlerts.displaySnackbar(context, 'Something went wrong');
        }
      });
    } else {
      // AppAlerts.displaySnackbar(context, result);
    }
  }
}
