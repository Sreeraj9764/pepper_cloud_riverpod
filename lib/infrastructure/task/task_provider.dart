import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'task_model.dart';
part 'task_provider.g.dart';

@riverpod
class TaskList extends _$TaskList {
  @override
  Future<List<Task>> build() async {
    final box = await Hive.openBox<Task>('tasks');
    return box.values.toList();
  }

  void addTask(Task task) async {
    final box = await Hive.openBox<Task>('tasks');
    await box.add(task);
    state = AsyncValue.data(box.values.toList());
  }

  void deleteTask(int key) async {
    final box = await Hive.openBox<Task>('tasks');
    await box.delete(key);
    state = AsyncValue.data(box.values.toList());
  }

  void toggleTaskCompletion(String taskId) async {
    final box = await Hive.openBox<Task>('tasks');
    final index = box.values.toList().indexWhere((task) => task.id == taskId);
    if (index != -1) {
      final updatedTask =
          box.getAt(index)?.copyWith(completed: !box.getAt(index)!.completed);
      if (updatedTask != null) {
        await box.putAt(index, updatedTask);
      }
      state = AsyncValue.data(box.values.toList());
    }
  }
}
