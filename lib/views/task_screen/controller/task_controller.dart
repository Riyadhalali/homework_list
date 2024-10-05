import 'package:get/get.dart';

import '../../../core/service/database_helper.dart';
import '../../../models/task.dart';

class TaskController extends GetxController {
  var taskList = <Task>[].obs;
  DatabaseHelper dbHelper = DatabaseHelper();

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  void loadTasks() async {
    var db = await dbHelper.database;
    List<Map<String, dynamic>> result = await db.query('tasks');
    taskList.value = result.map((data) => Task.fromMap(data)).toList();
  }

  void addTask(Task task) async {
    var db = await dbHelper.database;
    await db.insert('tasks', task.toMap());
    loadTasks();
  }

  void updateTask(Task task) async {
    var db = await dbHelper.database;
    await db
        .update('tasks', task.toMap(), where: 'id = ?', whereArgs: [task.id]);
    loadTasks();
  }

  void deleteTask(int id) async {
    var db = await dbHelper.database;
    await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
    loadTasks();
  }
}
