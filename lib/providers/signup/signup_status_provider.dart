import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_template_app/providers/signup/signup_profile_entity_provider.dart';
import 'package:flutter_todo_template_app/providers/signup/signup_status_notifier.dart';


final signUpStatusProvider =
    StateNotifierProvider<SignUpStatusNotifier, String>((ref) {
  final profile = ref.watch(signUpProfileEntityProvider);
  return SignUpStatusNotifier(profile);
});
