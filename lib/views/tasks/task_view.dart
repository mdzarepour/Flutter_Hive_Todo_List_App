import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:hive_todo/core/constants/app_strings.dart';
import 'package:hive_todo/core/theme/app_theme.dart';
import 'package:hive_todo/data/hive_data.dart';
import 'package:hive_todo/extentions/space_exs.dart';
import 'package:hive_todo/main.dart';
import 'package:hive_todo/models/task_model.dart';
import 'package:hive_todo/models/task_view_type_enum.dart';
import 'package:hive_todo/views/tasks/components/task_view_appbar.dart';
import 'package:hive_todo/views/tasks/widgets/task_view_inputWidget.dart';
import 'package:hive_todo/views/tasks/widgets/task_view_date_time_picker.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class TaskView extends StatefulWidget {
  final TaskViewTypeEnum taskViewType;
  final TaskModel? task;
  const TaskView(this.taskViewType, [this.task]);

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  late HiveData hiveData;
  late TextEditingController titleController;
  late TextEditingController descriptiomController;
  DateTime _time = DateTime.now();
  DateTime _date = DateTime.now();

  @override
  void initState() {
    titleController = TextEditingController(text: widget.task?.title);
    descriptiomController = TextEditingController(
      text: widget.task?.description,
    );
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptiomController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    hiveData = BaseWidget.of(context).hiveData;
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
                25.h,
                TaskViewInputWidget(
                  controller: descriptiomController,
                  hint: AppStrings.taskViewInputTwo,
                ),
                50.h,
                TaskViewDateTimePicker(
                  buttonTitle: DateFormat('yyyy-MM-dd').format(_date),
                  title: AppStrings.taskViewDate,
                  pickerWidget: DatePickerWidget(
                    pickerTheme: AppTheme.timeDatePickerTheme,
                    onMonthChangeStartWithFirstDate: true,
                    initialDateTime: _date,
                    onChange: (dateTime, _) {
                      setState(() {
                        _date = dateTime;
                      });
                    },
                  ),
                ),
                25.h,
                TaskViewDateTimePicker(
                  buttonTitle: DateFormat('hh : mm : ss a').format(_time),
                  title: AppStrings.taskViewTime,
                  pickerWidget: TimePickerWidget(
                    pickerTheme: AppTheme.timeDatePickerTheme,
                    initDateTime: _time,
                    onChange: (dateTime, _) {
                      setState(() {
                        _time = dateTime;
                      });
                    },
                  ),
                ),
                50.h,
                if (widget.taskViewType == TaskViewTypeEnum.update)
                  _buildbottomButtons(context),
                if (widget.taskViewType == TaskViewTypeEnum.create)
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: _addNewTask,
                      icon: const Icon(Iconsax.add_circle),
                      label: const Text(AppStrings.taskViewAddTask),
                    ),
                  ),
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
          onPressed: () => deleteTask(widget.task!),
          icon: const Icon(Iconsax.trash),
          label: const Text(AppStrings.taskViewDeleteTask),
        ),
        20.w,
        Expanded(
          child: FilledButton.icon(
            onPressed: () {
              updateTask();
            },
            icon: const Icon(Iconsax.arrow_up_2),
            label: const Text('update'),
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

  void updateTask() {
    widget.task?.title = titleController.text;
    widget.task?.description = descriptiomController.text;
    widget.task?.createdAtTime = _time;
    widget.task?.createdAtDate = _date;
    hiveData.updateTask(task: widget.task!);
    Navigator.pop(context);
  }

  void deleteTask(TaskModel task) {
    hiveData.deleteTask(task: task);
    Navigator.pop(context);
  }

  void _addNewTask() {
    hiveData.addNewTask(
      task: TaskModel.createNewTask(
        date: _date,
        time: _time,
        description: descriptiomController.text,
        title: titleController.text,
      ),
    );
    Navigator.pop(context);
  }
}
