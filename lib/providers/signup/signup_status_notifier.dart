import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/profile.dart';
import '../../validators/signup_validator.dart';



class SignUpStatusNotifier extends StateNotifier<String> {
  Profile _profile;

  SignUpStatusNotifier(this._profile) : super('');

  Future<void> validate() async {
    state = SignupValidator(profile: _profile).validate();
  }
}
