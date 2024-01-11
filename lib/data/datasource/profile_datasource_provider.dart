import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_template_app/data/datasource/profile_datasource.dart';

final profileDatasourceProvider = Provider<ProfileDatasource>((ref) {
  return ProfileDatasource();
});
