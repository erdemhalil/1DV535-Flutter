import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ToDoScreen(),
    );
  }
}

class ToDoScreen extends StatefulWidget {
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
    setState(() {
      String task = tasks.removeAt(index);
      textController.text = task;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo App'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        labelText: 'New Task',
                      ),
                      onSubmitted: (_) => addTask(),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  ElevatedButton(
                    onPressed: addTask,
                    child: Text('Add Item'),
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