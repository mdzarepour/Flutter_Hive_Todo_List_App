import 'package:flutter/material.dart';

class TaskViewDateTimePicker extends StatelessWidget {
  const TaskViewDateTimePicker({
    super.key,

    required this.pickerWidget,
    required this.buttonTitle,
    required this.title,
  });
  final Widget pickerWidget;
  final String buttonTitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: scheme.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(style: textTheme.headlineMedium, title),
          InkWell(
            onTap: () => _showPickerWidget(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: double.infinity,
              decoration: BoxDecoration(
                color: scheme.primary,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  style: textTheme.headlineMedium!.copyWith(
                    color: Colors.white,
                  ),
                  buttonTitle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showPickerWidget(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsetsGeometry.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          child: SizedBox(height: 260, child: pickerWidget),
        );
      },
    );
  }
}
