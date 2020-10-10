import 'package:flutter/cupertino.dart';

class Task with ChangeNotifier {
  final String id;
  String title, content;
  bool isImp;
  final DateTime createdDate;
  DateTime lastEdited;

  Task({
    @required this.id,
    @required this.title,
    @required this.content,
    @required this.isImp,
    @required this.createdDate,
    @required this.lastEdited,
  });
}

class TaskProvider with ChangeNotifier {
  bool _showImpOnly = false;
  List<Task> _tasks = [];
  List<Task> get tasks =>
      !_showImpOnly ? [..._tasks] : _tasks.where((task) => task.isImp).toList();
  bool get showImpOnly => _showImpOnly;

  void changeShowImpOnly(bool value) {
    _showImpOnly = value;
    notifyListeners();
  }

  void changeImpStatus(id) {
    _tasks.forEach((task) {
      if (task.id == id) task.isImp = !task.isImp;
    });
    notifyListeners();
  }

  void addTask({title, content}) {
    _tasks.add(Task(
      id: UniqueKey().toString(),
      title: title,
      content: content,
      isImp: false,
      createdDate: DateTime.now(),
      lastEdited: DateTime.now(),
    ));
    notifyListeners();
  }

  void deleteTask(id) {
    _tasks.removeWhere((task) => id == task.id);
    notifyListeners();
  }

  void updateTask({id, newTitle, newContent}) {
    _tasks.forEach((task) {
      if (task.id == id) {
        task.title = newTitle;
        task.content = newContent;
        task.lastEdited = DateTime.now();
      }
    });
    notifyListeners();
  }
}
