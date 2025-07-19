import 'package:flutter/material.dart';
import 'package:hive_todo/core/utils/dialog_messages.dart';
import 'package:hive_todo/data/hive_data.dart';
import 'package:iconsax/iconsax.dart';

class HomeViewAppbar extends StatelessWidget implements PreferredSizeWidget {
  final HiveData hiveDate;
  const HomeViewAppbar({super.key, required this.hiveDate});

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return PreferredSize(
      preferredSize: const Size.fromWidth(200),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: scheme.surface,
        actionsPadding: const EdgeInsets.only(right: 15),
        title: InkWell(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Icon(size: 30, color: scheme.onSurface, Iconsax.menu_1),
        ),
        actions: [
          InkWell(
            onTap: () {
              if (hiveDate.taskBox.isEmpty) {
                showEmptyTaskListWarningDialog(context);
              } else {
                showTaskDeletingDialog(context);
              }
            },
            child: const Icon(Iconsax.trash),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
