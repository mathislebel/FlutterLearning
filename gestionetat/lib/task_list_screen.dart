// screens/task_list_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'task_provider.dart';

class TaskListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final tasks = watch(taskProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            title: Text(task.title),
            trailing: Checkbox(
              value: task.isCompleted,
              onChanged: (value) {
                context.read(taskProvider.notifier).toggleTaskCompletion(task.id);
              },
            ),
            onLongPress: () {
              context.read(taskProvider.notifier).removeTask(task.id);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_task');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
