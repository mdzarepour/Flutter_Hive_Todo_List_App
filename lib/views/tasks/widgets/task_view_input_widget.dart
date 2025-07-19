import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TaskViewInputWidget extends StatelessWidget {
  const TaskViewInputWidget({
    super.key,
    required this.hint,
    required this.controller,
    required this.isDescription,
  });
  final String hint;
  final TextEditingController controller;
  final bool isDescription;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: isDescription ? 5 : 1,
      cursorWidth: 0.65,
      controller: controller,
      style: Theme.of(context).textTheme.headlineMedium,
      cursorColor: Theme.of(context).colorScheme.onSurface,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: isDescription ? null : const Icon(Iconsax.archive_1),
      ),
    );
  }
}
