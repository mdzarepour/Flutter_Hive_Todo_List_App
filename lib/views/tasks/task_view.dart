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
import 'package:hive_todo/views/tasks/widgets/task_view_footer_buttons.dart';
import 'package:hive_todo/views/tasks/widgets/task_view_input_widget.dart';
import 'package:hive_todo/views/tasks/widgets/task_view_date_time_picker.dart';

class TaskView extends StatefulWidget {
  final TaskViewTypeEnum taskViewType;
  final TaskModel? task;

  const TaskView(this.taskViewType, [this.task]);

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  late final bool isTypeUpdate;

  late final TextEditingController _titleController;
  late final TextEditingController _descripController;

  late DateTime _selectedTime;
  late DateTime _selectedDate;

  late HiveData _hiveData;

  @override
  void initState() {
    super.initState();
    isTypeUpdate = widget.taskViewType == TaskViewTypeEnum.update;

    _titleController = TextEditingController(text: widget.task?.title);
    _descripController = TextEditingController(text: widget.task?.description);

    _selectedDate = widget.task?.createdAtDate ?? DateTime.now();
    _selectedTime = widget.task?.createdAtTime ?? DateTime.now();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descripController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _hiveData = BaseWidget.of(context).hiveData;
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: scheme.surface,
        appBar: const TaskViewAppbar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      style: textTheme.headlineMedium,
                      text: isTypeUpdate
                          ? AppStr.taskViewUpdateYour
                          : AppStr.taskViewAddNew,
                    ),
                    TextSpan(
                      style: textTheme.bodyLarge,
                      text: AppStr.taskViewTask,
                    ),
                  ],
                ),
              ),
              Text(
                isTypeUpdate
                    ? AppStr.taskViewHeaderUpdate
                    : AppStr.taskViewHeaderCreate,
                textAlign: TextAlign.center,
                style: textTheme.headlineMedium,
              ),
              40.h,
              // title input -->
              TaskViewInputWidget(
                isDescription: false,
                hint: AppStr.taskViewInputOne,
                controller: _titleController,
              ),
              25.h,
              // description input -->
              TaskViewInputWidget(
                isDescription: true,
                controller: _descripController,
                hint: AppStr.taskViewInputTwo,
              ),
              50.h,
              // date picker -->
              TaskViewDateTimePicker(
                dateTimeValue: _selectedDate,
                title: AppStr.taskViewDate,
                pickerWidget: DatePickerWidget(
                  pickerTheme: AppTheme.timeDatePickerTheme,
                  onMonthChangeStartWithFirstDate: true,
                  initialDateTime: _selectedDate,
                  onChange: (dateTime, indexes) {
                    setState(() {
                      _selectedDate = dateTime;
                    });
                  },
                ),
              ),
              25.h,
              // time picker -->
              TaskViewDateTimePicker(
                dateTimeValue: _selectedTime,
                title: AppStr.taskViewTime,
                pickerWidget: TimePickerWidget(
                  pickerTheme: AppTheme.timeDatePickerTheme,
                  initDateTime: _selectedTime,
                  onChange: (dateTime, _) {
                    setState(() {
                      _selectedTime = dateTime;
                    });
                  },
                ),
              ),
              50.h,
              TaskViewFooterButtons(
                isTypeUpdate: isTypeUpdate,
                addNewTask: _addNewTask,
                deleteTask: _deleteTask,
                updateTask: _updateTask,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateTask() {
    widget.task!
      ..title = _titleController.text
      ..description = _descripController.text
      ..createdAtTime = _selectedTime
      ..createdAtDate = _selectedDate;
    _hiveData.updateTask(task: widget.task!);
    Navigator.pop(context);
  }

  _deleteTask() {
    _hiveData.deleteTask(task: widget.task!);
    Navigator.pop(context);
  }

  void _addNewTask() {
    _hiveData.addNewTask(
      task: TaskModel.createNewTask(
        date: _selectedDate,
        time: _selectedTime,
        description: _descripController.text,
        title: _titleController.text,
      ),
    );
    Navigator.pop(context);
  }
}
