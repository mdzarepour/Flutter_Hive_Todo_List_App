import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:hive_todo/core/constants/app_strings.dart';
import 'package:hive_todo/core/theme/app_theme.dart';
import 'package:hive_todo/extentions/space_exs.dart';
import 'package:hive_todo/views/tasks/components/task_view_appbar.dart';
import 'package:hive_todo/views/tasks/widgets/task_view_inputWidget.dart';
import 'package:hive_todo/views/tasks/widgets/task_view_time_picker.dart';
import 'package:iconsax/iconsax.dart';

class TaskView extends StatelessWidget {
  TaskView({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptiomController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        backgroundColor: scheme.surface,
        appBar: const TaskViewAppbar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                _buildHeader(textTheme),
                Text(
                  textAlign: TextAlign.center,
                  style: textTheme.headlineMedium,
                  AppStrings.taskViewHeader,
                ),
                40.h,
                TaskViewInputWidget(
                  hint: AppStrings.taskViewInputOne,
                  controller: titleController,
                ),
                25.h,
                TaskViewInputWidget(
                  controller: descriptiomController,
                  hint: AppStrings.taskViewInputTwo,
                ),
                50.h,
                TaskViewTimePicker(
                  openWidget: () {},
                  pickerWidget: TimePickerWidget(
                    pickerTheme: AppTheme.timeDatePickerTheme,
                  ),
                ),
                25.h,
                TaskViewTimePicker(
                  openWidget: () {},
                  pickerWidget: DatePickerWidget(
                    pickerTheme: AppTheme.timeDatePickerTheme,
                  ),
                ),
                50.h,
                _buildbottomButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildbottomButtons() {
    return Row(
      children: [
        Expanded(
          child: FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Iconsax.trash),
            label: const Text('Delete Task'),
          ),
        ),
        25.w,
        Expanded(
          child: FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Iconsax.add_circle),
            label: const Text('Add Task'),
          ),
        ),
      ],
    );
  }

  RichText _buildHeader(TextTheme textTheme) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            style: textTheme.headlineMedium,
            text: AppStrings.taskViewAddOne,
          ),
          TextSpan(style: textTheme.bodyLarge, text: AppStrings.taskViewAddTwo),
        ],
      ),
    );
  }
}
