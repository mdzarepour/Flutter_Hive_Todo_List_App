import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_todo/models/task_model.dart';

class HiveData {
  static const boxName = 'taskBox';
  final Box<TaskModel> taskBox = Hive.box(boxName);

  Future<void> addNewTask({required TaskModel task}) async {
    await taskBox.add(task);
  }

  Future<TaskModel?> readTask({required String id}) async {
    return taskBox.get(id);
  }

  List<int> readTaskListStats() {
    List<TaskModel> taskList = taskBox.values.toList();
    int counter = 0;
    for (int i = 0; i < taskList.length; i++) {
      if (taskList[i].isCompleted) {
        counter++;
      }
    }
    return [counter, taskList.length];
  }

  Future<void> updateTask({required TaskModel task}) async {
    await task.save();
  }

  Future<void> deleteTask({required TaskModel task}) async {
    await task.delete();
  }

  Future<void> deleteAllTask() async {
    await taskBox.clear();
  }

  ValueListenable<Box<TaskModel>> listenToBox() => taskBox.listenable();
}
