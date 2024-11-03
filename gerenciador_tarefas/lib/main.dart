import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/task_provider.dart';
import './screens/task_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskProvider()..loadTasks(),
      child: MaterialApp(
        title: 'Gerenciador de Tarefas',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TaskListScreen(),
      ),
    );
  }
}
