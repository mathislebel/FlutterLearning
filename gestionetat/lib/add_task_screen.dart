// screens/add_task_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'task_provider.dart';
import 'task.dart';

class AddTaskScreen extends StatelessWidget {
  final _titleController = TextEditingController();
  final Uuid uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Task Title'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final title = _titleController.text;
                if (title.isNotEmpty) {
                  final task = Task(id: uuid.v4(), title: title);
                  context.read(taskProvider.notifier).addTask(task); // Correction ici
                  Navigator.pop(context);
                }
              },
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
