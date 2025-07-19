import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_todo/models/task_view_type_enum.dart';
import 'package:hive_todo/views/tasks/task_view.dart';
import 'package:iconsax/iconsax.dart';

class HomeViewFab extends StatefulWidget {
  const HomeViewFab({super.key});

  @override
  State<HomeViewFab> createState() => _HomeViewFabState();
}

class _HomeViewFabState extends State<HomeViewFab> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final route = CupertinoPageRoute(
          builder: (context) =>
              const TaskView(taskViewType: TaskViewTypeEnum.create),
        );
        Navigator.push(context, route);
      },
      child: const Icon(Iconsax.add),
    );
  }
}
