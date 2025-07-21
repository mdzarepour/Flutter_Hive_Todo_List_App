import 'package:hive/hive.dart';
import 'package:hive_todo/core/constants/app_strings.dart';
import 'package:uuid/uuid.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  String description;
  @HiveField(2)
  DateTime createdAtTime;
  @HiveField(3)
  DateTime createdAtDate;
  @HiveField(4)
  String title;
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

  factory TaskModel.createNewTask({
    required DateTime time,
    required DateTime date,
    required String title,
    required String description,
  }) {
    const Uuid uuid = Uuid();
    return TaskModel(
      id: uuid.v1(),
      createdAtTime: time,
      createdAtDate: date,
      description: description == '' ? AppStr.taskViewDescription : description,
      title: title == '' ? AppStr.taskViewTitle : title,
      isCompleted: false,
    );
  }
}
