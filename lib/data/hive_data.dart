import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_todo/models/task_model.dart';

class HiveData {
  static const boxName = 'taskBox';
  final Box<TaskModel> taskBox = Hive.box(boxName);

  // create new task -->
  Future<void> addNewTask({required String id, required TaskModel task}) async {
    await taskBox.put(id, task);
  }

  // read task -->
  Future<TaskModel?> readTask({required String id}) async {
    return taskBox.get(id);
  }

  // update task -->
  Future<void> updateTask({required TaskModel task}) async {
    await task.save();
  }

  // delete task -->
  Future<void> deleteTask({required TaskModel task}) async {
    await task.delete();
  }

  // listen to box changes -->
  ValueListenable<Box<TaskModel>> listenToBox() => taskBox.listenable();
}
