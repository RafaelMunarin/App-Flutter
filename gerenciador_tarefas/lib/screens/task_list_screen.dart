import 'package:flutter/material.dart';
import '../models/task.dart';
import 'add_task_screen.dart';
import 'edit_task_screen.dart';
import '../providers/task_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/task_item.dart';

class TaskListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          // Verifica se não há tarefas e exibe uma mensagem
          if (taskProvider.tasks.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.assignment_late, size: 100, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    "Nenhuma tarefa disponível.",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: taskProvider.tasks.length,
            itemBuilder: (context, index) {
              final task = taskProvider.tasks[index];
              return Column(
                children: [
                  TaskItem(
                    task: task,
                    onEdit: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditTaskScreen(index: index, task: task),
                        ),
                      );
                    },
                    onDelete: () {
                      // Mostra um SnackBar quando uma tarefa é removida
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Tarefa removida!"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      taskProvider.removeTask(index);
                    },
                  ),
                  Divider(height: 1), // Separador entre as tarefas
                ],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
        tooltip: "Adicionar Tarefa",
      ),
    );
  }
}
