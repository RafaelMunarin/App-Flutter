import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  String selectedTag = 'Normal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adicionar Tarefa")),
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
                Provider.of<TaskProvider>(context, listen: false).addTask(
                  titleController.text,
                  subjectController.text,
                  selectedTag,
                );
                Navigator.pop(context);
              },
              child: Text('Salvar Tarefa'),
            ),
          ],
        ),
      ),
    );
  }
}
