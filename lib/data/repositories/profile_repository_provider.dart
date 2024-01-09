import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_template_app/data/repositories/profile_repository.dart';
import 'package:flutter_todo_template_app/data/repositories/profile_repository_impl.dart';
import '../datasource/profile_datasource_provider.dart';


final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final datasource = ref.read(profileDatasourceProvider);
  return ProfileRepositoryImpl(datasource);
});
