import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/profile.dart';

final signUpProfileEntityProvider = StateProvider<Profile>((ref) {
  return const Profile();
});
