import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:hive_todo/core/constants/app_strings.dart';
import 'package:hive_todo/core/theme/app_theme.dart';
import 'package:hive_todo/extentions/space_exs.dart';
import 'package:hive_todo/main.dart';
import 'package:hive_todo/models/task_model.dart';
import 'package:hive_todo/models/task_view_type_enum.dart';
import 'package:hive_todo/views/tasks/components/task_view_appbar.dart';
import 'package:hive_todo/views/tasks/widgets/task_view_inputWidget.dart';
import 'package:hive_todo/views/tasks/widgets/task_view_date_time_picker.dart';
import 'package:iconsax/iconsax.dart';

class TaskView extends StatefulWidget {
  final TaskViewTypeEnum taskViewType;
  const TaskView({super.key, required this.taskViewType});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptiomController = TextEditingController();
  late DateTime _time = DateTime.now();
  late DateTime _date = DateTime.now();

  @override
  void dispose() {
    titleController.dispose();
    descriptiomController.dispose();
    super.dispose();
  }

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
            padding: const EdgeInsets.symmetric(horizontal: 25),
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
                25.h, // Vertical spacing
                TaskViewInputWidget(
                  controller: descriptiomController,
                  hint: AppStrings.taskViewInputTwo,
                ),
                50.h, // Vertical spacing
                // Date picker widget
                TaskViewDateTimePicker(
                  buttonTitle: AppStrings.taskViewSelectDate,
                  title: AppStrings.taskViewDate,
                  pickerWidget: DatePickerWidget(
                    pickerTheme: AppTheme.timeDatePickerTheme,
                    onMonthChangeStartWithFirstDate: true,
                    initialDateTime: DateTime.now(),
                    onChange: (dateTime, _) {
                      setState(() {
                        _date = dateTime;
                      });
                    },
                  ),
                ),
                25.h,
                TaskViewDateTimePicker(
                  pickerWidget: TimePickerWidget(
                    pickerTheme: AppTheme.timeDatePickerTheme,

                    onChange: (dateTime, _) {
                      setState(() {
                        _time = dateTime;
                      });
                    },
                  ),
                  buttonTitle: AppStrings.taskViewSelectTime,
                  title: AppStrings.taskViewTime,
                ),
                50.h, // Vertical spacing
                _buildbottomButtons(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildbottomButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FilledButton.icon(
          onPressed: () {},
          icon: const Icon(Iconsax.trash),
          label: const Text(AppStrings.taskViewDeleteTask),
        ),
        FilledButton.icon(
          onPressed: _addNewTask,
          icon: const Icon(Iconsax.add_circle),
          label: const Text(AppStrings.taskViewAddTask),
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

  void _addNewTask() {
    final String currentTitle = titleController.text;
    final String currentDescription = descriptiomController.text;
    final DateTime selectedDate = _date;
    final DateTime selectedTime = _time;
    BaseWidget.of(context).hiveData.addNewTask(
      task: TaskModel.createNewTask(
        date: selectedDate,
        time: selectedTime,
        description: currentDescription,
        title: currentTitle,
      ),
    );
    Navigator.pop(context);
  }
}
