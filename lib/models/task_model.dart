import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final DateTime createdAtTime;
  @HiveField(3)
  final DateTime createdAtDate;
  @HiveField(4)
  final String title;
  @HiveField(5)
  bool isCompleted;

  TaskModel({
    required this.id,
    required this.createdAtTime,
    required this.createdAtDate,
    required this.description,
    required this.title,
    required this.isCompleted,
  });

  factory TaskModel.createNewTask(TaskModel task) {
    const Uuid uuid = Uuid();
    return TaskModel(
      id: uuid.v1(),
      createdAtTime: task.createdAtTime,
      createdAtDate: task.createdAtDate,
      description: task.description,
      title: task.title,
      isCompleted: false,
    );
  }
}
