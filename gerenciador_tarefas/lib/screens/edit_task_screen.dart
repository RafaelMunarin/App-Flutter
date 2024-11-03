import 'package:flutter/material.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';
import 'package:provider/provider.dart';

class EditTaskScreen extends StatefulWidget {
  final int index;
  final Task task;

  EditTaskScreen({required this.index, required this.task});

  @override
  _EditTaskScreenState createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late TextEditingController titleController;
  late TextEditingController subjectController;
  late String selectedTag;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.task.title);
    subjectController = TextEditingController(text: widget.task.subject);
    selectedTag = widget.task.tag;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Editar Tarefa")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: subjectController,
              decoration: InputDecoration(labelText: 'Assunto'),
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              value: selectedTag,
              onChanged: (String? newValue) {
                setState(() {
                  selectedTag = newValue!;
                });
              },
              items: <String>['Normal', 'Urgente', 'Trabalho', 'Estudo']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final taskProvider = Provider.of<TaskProvider>(context, listen: false);
                taskProvider.updateTask(
                  widget.index,
                  titleController.text,
                  subjectController.text,
                  selectedTag,
                );
                Navigator.pop(context);
              },
              child: Text('Atualizar Tarefa'),
            ),
          ],
        ),
      ),
    );
  }
}
