import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final bool completed;
  @HiveField(4)
  final DateTime dateTime;

  Task({
    required this.id,
    required this.title,
    required this.description,
    this.completed = false,
    required this.dateTime,
  });

  Task copyWith({
    String? id,
    String? title,
    String? description,
    bool? completed,
    DateTime? dateTime,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      completed: completed ?? this.completed,
      dateTime: dateTime ?? this.dateTime, 
    );
  }
}
