import 'package:test/test.dart';
import 'package:todoapp/model/task.dart';
import 'package:todoapp/provider/tasknotifier.dart';

void main() {
  test('test get task', () {
    final TaskNotifier notifier = TaskNotifier();
    expect(notifier.getItem(1), isNotNull);
  });

  test('test update value', () {
    Task newTask = Task(true, "Test");
    final TaskNotifier notifier = TaskNotifier();
    notifier.updateItem(1, newTask);
    expect(notifier.taskList[1], equals(newTask));
  });
}