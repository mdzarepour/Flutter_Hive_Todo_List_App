import 'package:flutter/material.dart';
import 'package:hive_todo/core/constants/app_strings.dart';
import 'package:hive_todo/extentions/space_exs.dart';

import 'package:hive_todo/models/task_view_type_enum.dart';
import 'package:iconsax/iconsax.dart';

class TaskViewFooterButtons extends StatelessWidget {
  final TaskViewTypeEnum taskViewType;
  final Function() deleteTask;
  final Function() updateTask;
  final Function() addNewTask;
  const TaskViewFooterButtons({
    super.key,
    required this.taskViewType,
    required this.addNewTask,
    required this.deleteTask,
    required this.updateTask,
  });

  @override
  Widget build(BuildContext context) {
    return taskViewType == TaskViewTypeEnum.update
        ? _buildUpdateDeleteButtons()
        : _buildCreateButton();
  }

  Widget _buildUpdateDeleteButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FilledButton.icon(
          onPressed: () => deleteTask,
          icon: const Icon(Iconsax.trash),
          label: const Text(AppStr.taskViewDeleteTask),
        ),
        20.w,
        Expanded(
          child: FilledButton.icon(
            onPressed: updateTask,
            icon: const Icon(Iconsax.arrow_up_2),
            label: const Text(AppStr.taskViewUpdate),
          ),
        ),
      ],
    );
  }

  Widget _buildCreateButton() {
    return SizedBox(
      width: double.infinity,
      child: FilledButton.icon(
        onPressed: addNewTask,
        icon: const Icon(Iconsax.add_circle),
        label: const Text(AppStr.taskViewAddTask),
      ),
    );
  }
}
