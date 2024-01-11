import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_template_app/providers/login/profile_entity_provider.dart';
import 'login_status_notifier.dart';


final loginStatusProvider =
    StateNotifierProvider<LoginStatusNotifier, String>((ref) {
  final profile = ref.watch(profileEntityProvider);
  return LoginStatusNotifier(profile);
});
