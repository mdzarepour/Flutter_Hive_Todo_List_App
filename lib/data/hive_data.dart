import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_todo/models/task_model.dart';

class HiveData {
  static const boxName = 'taskBox';
  final Box<TaskModel> taskBox = Hive.box(boxName);

  Future<void> addNewTask({required String id, required TaskModel task}) async {
    await taskBox.put(id, task);
  }

  Future<TaskModel?> readTask({required String id}) async {
    return taskBox.get(id);
  }

  Future<void> updateTask({required TaskModel task}) async {
    await task.save();
  }

  Future<void> deleteTask({required TaskModel task}) async {
    await task.delete();
  }

  ValueListenable<Box<TaskModel>> listenToBox() => taskBox.listenable();
}
