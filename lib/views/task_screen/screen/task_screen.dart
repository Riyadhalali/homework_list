import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/task.dart';
import '../controller/task_controller.dart';

class TaskListScreen extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Tasks'),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: taskController.taskList.length,
          itemBuilder: (context, index) {
            final task = taskController.taskList[index];
            return ListTile(
              title: Text(task.title),
              subtitle: Text(task.description),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => taskController.deleteTask(task.id!),
              ),
              onTap: () => _editTaskDialog(context, task),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTaskDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _addTaskDialog(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Task'),
        content: Column(
          children: [
            TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title')),
            TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description')),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              taskController.addTask(Task(
                title: titleController.text,
                description: descriptionController.text,
              ));
              Navigator.of(context).pop();
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  void _editTaskDialog(BuildContext context, Task task) {
    final titleController = TextEditingController(text: task.title);
    final descriptionController = TextEditingController(text: task.description);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Task'),
        content: Column(
          children: [
            TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title')),
            TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description')),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              task.title = titleController.text;
              task.description = descriptionController.text;
              taskController.updateTask(task);
              Navigator.of(context).pop();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
