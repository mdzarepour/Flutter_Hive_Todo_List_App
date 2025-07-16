import 'package:flutter/material.dart';
import 'package:hive_todo/core/theme/app_theme.dart';
import 'package:hive_todo/views/home/home_view.dart';

void main(List<String> args) async {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appThem,
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
