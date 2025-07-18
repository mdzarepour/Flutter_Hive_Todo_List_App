import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_todo/views/tasks/task_view.dart';
import 'package:iconsax/iconsax.dart';

class HomeViewFab extends StatelessWidget {
  const HomeViewFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final route = CupertinoPageRoute(builder: (context) => TaskView());
        Navigator.push(context, route);
      },
      child: const Icon(Iconsax.add),
    );
  }
}
