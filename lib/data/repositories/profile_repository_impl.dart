

import '../datasource/profile_datasource.dart';
import '../models/profile.dart';
import 'profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDatasource _datasource;

  ProfileRepositoryImpl(this._datasource);

  @override
  Future<bool> createNewUser(Profile profile) async {
    try {
      return await _datasource.createNewUser(profile);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<Profile?> getUser(Profile profile) async {
    try {
      return await _datasource.getUser(profile);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> updateUser(Profile profile) async {
    try {
      await _datasource.updateUser(profile);
    } catch (e) {
      throw '$e';
    }
  }
}
