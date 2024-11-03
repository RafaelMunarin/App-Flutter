import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksString = prefs.getStringList('tasks') ?? [];
    _tasks = tasksString.map((task) => Task(title: task, subject: '', tag: 'Normal')).toList();
    notifyListeners();
  }

  Future<void> addTask(String title, String subject, String tag) async {
    final newTask = Task(title: title, subject: subject, tag: tag);
    _tasks.add(newTask);
    await _saveTasks();
    notifyListeners();
  }

  Future<void> updateTask(int index, String title, String subject, String tag) async {
    _tasks[index] = Task(title: title, subject: subject, tag: tag);
    await _saveTasks();
    notifyListeners();
  }

  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksString = _tasks.map((task) => task.title).toList();
    prefs.setStringList('tasks', tasksString);
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
