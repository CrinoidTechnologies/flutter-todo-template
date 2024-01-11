import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/profile.dart';
import '../../validators/login_validator.dart';



class LoginStatusNotifier extends StateNotifier<String> {
  Profile _profile;

  LoginStatusNotifier(this._profile) : super('');

  Future<void> validate() async {
    state = LoginValidator(profile: _profile).validate();
  }
}
