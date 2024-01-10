import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_template_app/utils/extensions.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../config/routes/routes_location.dart';
import '../data/models/task.dart';
import '../generated/l10n.dart';
import '../providers/date_provider.dart';
import '../providers/task/tasks_provider.dart';
import '../utils/helpers.dart';
import '../widgets/display_list_of_tasks.dart';
import '../widgets/display_white_text.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const HomeScreen();

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final date = ref.watch(dateProvider);
    final taskState = ref.watch(tasksProvider);
    final inCompletedTasks = _inCompletedTask(taskState.tasks, ref);
    final completedTasks = _completedTask(taskState.tasks, ref);
    final colors = context.colorScheme;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).pending,
              style: context.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(20),
            Expanded(
              child: DisplayListOfTasks(
                tasks: inCompletedTasks,
              ),
            ),
            const Gap(20),
            Text(
              S.current.completed,
              style: context.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(20),
            Expanded(
              child: DisplayListOfTasks(
                isCompletedTasks: true,
                tasks: completedTasks,
              ),
            ),
            const Gap(20),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                key: const Key('btn_add_new_task'),
                onPressed: () => context.push(RouteLocation.createTask),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DisplayWhiteText(
                    text: S.of(context).addNewTask,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: colors.primary,
        title: DisplayWhiteText(
          text: S.current.myTodoList,
        ),
      ),
    );
  }

  List<Task> _inCompletedTask(List<Task> tasks, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final List<Task> filteredTask = [];

    for (var task in tasks) {
      if (!task.isCompleted) {
        final isTaskDay = Helpers.isTaskFromSelectedDate(task, date);
        if (isTaskDay) {
          filteredTask.add(task);
        }
      }
    }
    return filteredTask;
  }

  List<Task> _completedTask(List<Task> tasks, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final List<Task> filteredTask = [];

    for (var task in tasks) {
      if (task.isCompleted) {
        final isTaskDay = Helpers.isTaskFromSelectedDate(task, date);
        if (isTaskDay) {
          filteredTask.add(task);
        }
      }
    }
    return filteredTask;
  }
}
