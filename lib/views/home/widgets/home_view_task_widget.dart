import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_todo/core/constants/app_strings.dart';
import 'package:hive_todo/extentions/space_exs.dart';
import 'package:hive_todo/models/task_model.dart';
import 'package:hive_todo/models/task_view_type_enum.dart';
import 'package:hive_todo/views/tasks/task_view.dart';
import 'package:intl/intl.dart';

class HomeViewTaskWidget extends StatefulWidget {
  const HomeViewTaskWidget({super.key, required this.task});
  final TaskModel task;

  @override
  State<HomeViewTaskWidget> createState() => _HomeViewTaskWidgetState();
}

class _HomeViewTaskWidgetState extends State<HomeViewTaskWidget> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        final route = CupertinoPageRoute(
          builder: (context) {
            return TaskView(TaskViewTypeEnum.update, widget.task);
          },
        );
        Navigator.push(context, route);
      },
      child: Container(
        height: 100,
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colorScheme.secondary,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Transform.scale(
                scale: 1.5,
                child: Checkbox(
                  activeColor: colorScheme.secondary,
                  value: widget.task.isCompleted,
                  onChanged: (value) {
                    setState(() {
                      widget.task.isCompleted = value!;
                      widget.task.save();
                    });
                  },
                ),
              ),
            ),
            20.w,
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.headlineMedium!.copyWith(
                        decoration: widget.task.isCompleted
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                      widget.task.title,
                    ),
                  ),
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleMedium,
                    widget.task.description,
                  ),
                ],
              ),
            ),
            10.w,
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    style: textTheme.headlineMedium,
                    DateFormat(
                      AppStr.dateFormatter,
                    ).format(widget.task.createdAtDate),
                  ),
                  Text(
                    style: textTheme.titleMedium,
                    DateFormat(
                      AppStr.timeFormatter,
                    ).format(widget.task.createdAtTime),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
