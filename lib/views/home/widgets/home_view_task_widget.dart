import 'package:flutter/material.dart';
import 'package:hive_todo/extentions/space_exs.dart';

class HomeViewTaskWidget extends StatefulWidget {
  const HomeViewTaskWidget({super.key});

  @override
  State<HomeViewTaskWidget> createState() => _HomeViewTaskWidgetState();
}

class _HomeViewTaskWidgetState extends State<HomeViewTaskWidget> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      //TODO navigate to read screen
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
                  value: false,
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
              20.w,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(style: textTheme.headlineMedium, 'Done'),
                  Text(style: textTheme.titleMedium, 'Description'),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(style: textTheme.headlineMedium, 'Date'),
                  Text(style: textTheme.titleMedium, 'SubDate'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
