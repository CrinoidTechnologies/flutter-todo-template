import 'package:equatable/equatable.dart';

import '../../utils/profile_keys.dart';

class Profile extends Equatable {
  final int? id;
  final String? email;
  final String? password;
  final String? firstName;
  final String? lastName;

  @override
  List<Object?> get props => [id, email, password, firstName, lastName];

  const Profile(
      {this.id, this.email, this.password, this.firstName, this.lastName});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      ProfileKeys.id: id,
      ProfileKeys.email: email ?? '',
      ProfileKeys.password: password ?? '',
      ProfileKeys.firstName: firstName ?? '',
      ProfileKeys.lastName: lastName ?? '',
    };
  }

  factory Profile.fromJson(Map<String, dynamic> map) {
    return Profile(
      id: map[ProfileKeys.id],
      email: map[ProfileKeys.email],
      password: map[ProfileKeys.password],
      firstName: ProfileKeys.firstName,
      lastName: ProfileKeys.lastName,
    );
  }

  Profile copyWith() {
    return Profile(
      id: id ,
      email: email ,
      password: password ,
      firstName: firstName ,
      lastName: lastName ,
    );
  }
}
