import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/profile.dart';

final profileEntityProvider = StateProvider<Profile>((ref) {
  return const Profile();
});