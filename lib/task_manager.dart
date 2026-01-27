import 'package:flutter/material.dart';

class Task {
  final String title;
  final String date;
  final IconData icon;

  Task({required this.title, required this.date, required this.icon});
}

class TaskManager with ChangeNotifier {
  final List<Task> _tasks = [
    Task(icon: Icons.article, title: 'UI Development', date: '17 August 2020'),
    Task(
      icon: Icons.dashboard,
      title: 'Dashboard Design',
      date: '17 August 2020',
    ),
    Task(icon: Icons.web, title: 'Landing Page', date: '28 July 2020'),
    Task(
      icon: Icons.design_services,
      title: 'Wireframe elements',
      date: '28 July 2020',
    ),
  ];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void moveTask(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final Task item = _tasks.removeAt(oldIndex);
    _tasks.insert(newIndex, item);
    notifyListeners();
  }
}
