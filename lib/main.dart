import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_todo/core/theme/app_theme.dart';
import 'package:hive_todo/data/hive_data.dart';
import 'package:hive_todo/models/task_model.dart';
import 'package:hive_todo/views/home/home_view.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>(HiveData.boxName);
  runApp(BaseWidget(child: const Application()));
}

class BaseWidget extends InheritedWidget {
  BaseWidget({super.key, required this.child}) : super(child: child);
  final HiveData hiveData = HiveData();
  @override
  final Widget child;

  static BaseWidget of(BuildContext context) {
    final base = context.dependOnInheritedWidgetOfExactType<BaseWidget>();
    if (base != null) {
      return base;
    } else {
      throw StateError('could not found encestor widget of type BaseWidget');
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    print(BaseWidget.of(context).hiveData.taskBox.values.length);
    print('hive content ==>');
    return MaterialApp(
      theme: AppTheme.appThem,
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
