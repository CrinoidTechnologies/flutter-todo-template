import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/profile.dart';
import '../../data/repositories/profile_repository.dart';

class ProfileNotifier extends StateNotifier<Profile?> {
  final ProfileRepository _repository;

  ProfileNotifier(this._repository) : super(null);

  Future<bool> createNewUser(Profile profile) async {
    try {
      return await _repository.createNewUser(profile);
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<Profile?> getUser(Profile profile) async {
    try {
      var data = await _repository.getUser(profile);
      state = data?.copyWith();
      return state;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
