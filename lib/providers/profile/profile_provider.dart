import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_template_app/providers/profile/profile_notifier.dart';

import '../../data/models/profile.dart';
import '../../data/repositories/profile_repository_provider.dart';


final profileProvider = StateNotifierProvider<ProfileNotifier, Profile?>((ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return ProfileNotifier(repository);
});
