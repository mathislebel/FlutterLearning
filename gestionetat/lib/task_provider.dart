// providers/task_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'task.dart';

class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier() : super([]);

  void addTask(Task task) {
    state = [...state, task];
  }

  void toggleTaskCompletion(String taskId) {
    state = state.map((task) {
      if (task.id == taskId) {
        return Task(id: task.id, title: task.title, isCompleted: !task.isCompleted);
      }
      return task;
    }).toList();
  }

  void removeTask(String taskId) {
    state = state.where((task) => task.id != taskId).toList();
  }
}

final taskProvider = StateNotifierProvider<TaskNotifier, List<Task>>((ref) => TaskNotifier());
