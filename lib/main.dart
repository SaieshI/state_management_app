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
        tasks.add({"Name": controlTasks.text, "isCompleted":false});
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
}
