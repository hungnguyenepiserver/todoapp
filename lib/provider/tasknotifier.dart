import 'package:flutter/cupertino.dart';
import 'package:todoapp/model/task.dart';

class TaskNotifier with ChangeNotifier {

  final List<Task> _taskList = [Task(true, "Have a breakfast"), Task(false, "Do workout"), Task(true, "Go to work")];
  List<Task> get taskList => _taskList;

  void updateItem(int index, Task task){
    _taskList[index] = task;
    notifyListeners();
  }

  Task getItem(int index) => _taskList[index];
}