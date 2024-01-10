import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_template_app/data/repositories/task_repository.dart';
import 'package:flutter_todo_template_app/data/repositories/task_repository_impl.dart';
import '../datasource/task_datasource_provider.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  final datasource = ref.read(taskDatasourceProvider);
  return TaskRepositoryImpl(datasource);
});
