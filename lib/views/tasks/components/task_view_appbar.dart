import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TaskViewAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TaskViewAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(Iconsax.arrow_left),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
