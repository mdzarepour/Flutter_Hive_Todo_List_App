import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_todo/core/constants/app_strings.dart';
import 'package:hive_todo/core/theme/app_theme.dart';
import 'package:hive_todo/data/hive_data.dart';
import 'package:hive_todo/models/task_model.dart';
import 'package:hive_todo/views/home/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>(HiveData.boxName);
  runApp(BaseWidget(hiveData: HiveData(), child: const Application()));
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

class BaseWidget extends InheritedWidget {
  final HiveData hiveData;
  const BaseWidget({super.key, required this.hiveData, required super.child});

  static BaseWidget of(BuildContext context) {
    final base = context.dependOnInheritedWidgetOfExactType<BaseWidget>();
    if (base == null) throw StateError(AppStr.baseWidgetError);
    return base;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
