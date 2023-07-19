import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ToDoScreen(),
    );
  }
}

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  List<String> tasks = [];

  TextEditingController textController = TextEditingController();

  void addTask() {
    String task = textController.text;
    if (task.isNotEmpty) {
      setState(() {
        tasks.add(task);
        textController.clear();
      });
    }
  }

  void removeTask(int index) {
    String removedTask = tasks.removeAt(index);
    setState(() {
      if (textController.text == removedTask) {
        textController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo App'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textController,
                      decoration: const InputDecoration(
                        labelText: 'New Task',
                      ),
                      onSubmitted: (_) => addTask(),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  ElevatedButton(
                    onPressed: addTask,
                    child: const Text('Add Item'),
                  ), 
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(tasks[index]),
                    onTap: () => removeTask(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
