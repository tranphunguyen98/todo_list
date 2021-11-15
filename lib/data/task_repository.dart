import 'package:hive/hive.dart';

import 'model/task.dart';

class TaskRepository {
  late Box _taskBox;
  TaskRepository() {
    _taskBox = Hive.box('task');
  }

  void addTask(Task task) {
    _taskBox.add(task);
  }
}
