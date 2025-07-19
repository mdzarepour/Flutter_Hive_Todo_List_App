import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TaskViewInputWidget extends StatelessWidget {
  const TaskViewInputWidget({
    super.key,
    required this.hint,
    required this.controller,
  });
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    bool isDescription = hint.startsWith('w');
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return TextFormField(
      maxLines: isDescription ? 5 : 1,
      cursorWidth: 0.65,
      controller: controller,
      style: textTheme.headlineMedium,
      cursorColor: scheme.onSurface,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: isDescription ? null : const Icon(Iconsax.archive_1),
      ),
    );
  }
}
