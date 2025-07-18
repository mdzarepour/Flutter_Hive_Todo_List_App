import 'package:flutter/material.dart';
import 'package:hive_todo/extentions/space_exs.dart';
import 'package:hive_todo/models/task_model.dart';
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
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      child: AnimatedContainer(
        height: 100,
        duration: const Duration(milliseconds: 600),
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: scheme.secondary,
        ),
        child: Padding(
          padding: const EdgeInsetsGeometry.only(left: 10, right: 20),
          child: Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Checkbox(
                  activeColor: scheme.secondary,
                  value: widget.task.isCompleted,
                  onChanged: (value) {
                    setState(() {
                      widget.task.isCompleted = value!;
                    });
                  },
                ),
              ),
              20.w,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    style: textTheme.headlineMedium!.copyWith(
                      decoration: widget.task.isCompleted
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                    widget.task.title,
                  ),
                  Text(style: textTheme.titleMedium, widget.task.description),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    style: textTheme.headlineMedium,
                    DateFormat('yyyy-MM-dd').format(widget.task.createdAtDate),
                  ),
                  Text(
                    style: textTheme.titleMedium,
                    DateFormat('HH:mm:ss').format(widget.task.createdAtTime),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
