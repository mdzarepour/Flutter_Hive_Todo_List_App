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
import 'package:hive_todo/views/tasks/widgets/task_view_input_widget.dart';
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
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;

  late DateTime _selectedTime;
  late DateTime _selectedDate;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late HiveData _hiveData;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task?.title ?? '');
    _descriptionController = TextEditingController(
      text: widget.task?.description ?? '',
    );

    _selectedDate = widget.task?.createdAtDate ?? DateTime.now();
    _selectedTime = widget.task?.createdAtTime ?? DateTime.now();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _hiveData = BaseWidget.of(context).hiveData;
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: _unfocusKeyboard,
      child: Scaffold(
        backgroundColor: scheme.surface,
        appBar: const TaskViewAppbar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildHeader(textTheme),
                Text(
                  AppStrings.taskViewHeader,
                  textAlign: TextAlign.center,
                  style: textTheme.headlineMedium,
                ),
                40.h,
                TaskViewInputWidget(
                  hint: AppStrings.taskViewInputOne,
                  controller: _titleController,
                ),
                25.h,
                TaskViewInputWidget(
                  controller: _descriptionController,
                  hint: AppStrings.taskViewInputTwo,
                ),
                50.h,
                TaskViewDateTimePicker(
                  buttonTitle: DateFormat(
                    AppStrings.dateFormatter,
                  ).format(_selectedDate),
                  title: AppStrings.taskViewDate,
                  pickerWidget: DatePickerWidget(
                    pickerTheme: AppTheme.timeDatePickerTheme,
                    onMonthChangeStartWithFirstDate: true,
                    initialDateTime: _selectedDate,
                    onChange: (dateTime, _) =>
                        setState(() => _selectedDate = dateTime),
                  ),
                ),
                25.h,
                TaskViewDateTimePicker(
                  buttonTitle: DateFormat(
                    AppStrings.timeFormatter,
                  ).format(_selectedTime),
                  title: AppStrings.taskViewTime,
                  pickerWidget: TimePickerWidget(
                    pickerTheme: AppTheme.timeDatePickerTheme,
                    initDateTime: _selectedTime,
                    onChange: (dateTime, _) =>
                        setState(() => _selectedTime = dateTime),
                  ),
                ),
                50.h,
                _buildActionButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return widget.taskViewType == TaskViewTypeEnum.update
        ? _buildUpdateDeleteButtons()
        : _buildCreateButton();
  }

  Widget _buildUpdateDeleteButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FilledButton.icon(
          onPressed: () => _deleteTask(widget.task!),
          icon: const Icon(Iconsax.trash),
          label: const Text(AppStrings.taskViewDeleteTask),
        ),
        20.w,
        Expanded(
          child: FilledButton.icon(
            onPressed: _updateTask,
            icon: const Icon(Iconsax.arrow_up_2),
            label: const Text(AppStrings.taskViewUpdate),
          ),
        ),
      ],
    );
  }

  Widget _buildCreateButton() {
    return SizedBox(
      width: double.infinity,
      child: FilledButton.icon(
        onPressed: _addNewTask,
        icon: const Icon(Iconsax.add_circle),
        label: const Text(AppStrings.taskViewAddTask),
      ),
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

  void _unfocusKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void _updateTask() {
    if (_formKey.currentState!.validate()) {
      widget.task!
        ..title = _titleController.text
        ..description = _descriptionController.text
        ..createdAtTime = _selectedTime
        ..createdAtDate = _selectedDate;
      _hiveData.updateTask(task: widget.task!);
      Navigator.pop(context);
    }
  }

  void _deleteTask(TaskModel task) {
    _hiveData.deleteTask(task: task);
    Navigator.pop(context);
  }

  void _addNewTask() {
    if (_formKey.currentState!.validate()) {
      _hiveData.addNewTask(
        task: TaskModel.createNewTask(
          date: _selectedDate,
          time: _selectedTime,
          description: _descriptionController.text,
          title: _titleController.text,
        ),
      );
      Navigator.pop(context);
    }
  }
}
