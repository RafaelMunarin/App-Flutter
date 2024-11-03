import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const TaskItem({
    Key? key,
    required this.task,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color tagColor;
    switch (task.tag) {
      case 'Urgente':
        tagColor = Colors.redAccent;
        break;
      case 'Trabalho':
        tagColor = Colors.blueAccent;
        break;
      case 'Estudo':
        tagColor = Colors.greenAccent;
        break;
      default:
        tagColor = Colors.grey;
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Exibindo um ícone baseado na tag
            Container(
              decoration: BoxDecoration(
                color: tagColor,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.label,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 16),
            // Coluna para as informações da tarefa
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    task.subject,
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Tag: ${task.tag}",
                    style: TextStyle(fontSize: 14, color: tagColor),
                  ),
                ],
              ),
            ),
            // Botões de edição e remoção
            Column(
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: onEdit,
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: onDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
