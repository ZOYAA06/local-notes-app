import 'package:hive/hive.dart';

import '../models/task.dart';

class TaskStorage {
  final Box<Task> taskBox = Hive.box<Task>('tasks');

  List<Task> getTasks() {
    return taskBox.values.toList();
  }

 Future<void> addTask(Task task) async {
  await taskBox.add(task);

}

  Future<void> deleteTask(int index) async {
    await taskBox.deleteAt(index);
  }

  Future<void> updateTask(int index, Task task) async {
    await taskBox.putAt(index, task);
  }
}