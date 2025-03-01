import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Task Manager'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController controlTasks = TextEditingController();
  List<Map<String, dynamic>> tasks = [];

  void addTask() {
    if (controlTasks.text.isNotEmpty) {
      setState(() {
        tasks.add({"Name": controlTasks.text, "isCompleted": false});
        controlTasks.clear();
      });
    }
  }

  void taskComplete(int index) {
    setState(() {
      tasks[index]["isCompleted"] = !tasks[index]["isCompleted"];
    });
  }

  void removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controlTasks,
                    decoration:
                        const InputDecoration(hintText: 'Enter Task Name'),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                    onPressed: addTask, child: const Text('Add Task')),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Checkbox(
                          value: tasks[index]["isCompleted"],
                          onChanged: (value) => taskComplete(index)),
                      title: Text(
                        tasks[index]["Name"],
                        style: TextStyle(
                          decoration: tasks[index]["isCompleted"]
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => removeTask(index),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
