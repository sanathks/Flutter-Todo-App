import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/todos.dart';
import 'package:todo/screens/dashboard.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Todos(),
      child: const TodoApp(),
    ),
  );
}
class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}
