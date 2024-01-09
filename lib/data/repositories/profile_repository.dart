import '../models/profile.dart';

abstract class ProfileRepository {
  Future<bool> createNewUser(Profile profile);

  Future<void> updateUser(Profile profile);

  Future<Profile?> getUser(Profile profile);
}
