import 'package:api_todo_provider/provider/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<TodoProvider>(context, listen: false).getAllTodo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TodoProvider>(
        builder: (BuildContext context, TodoProvider provider, Widget? child) {
          // if (value.isLoading) {
          //   return Center(
          //     child: CircularProgressIndicator(),
          //   );
          // }
          final todos = provider.todos;
          return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return Card(
                  color: todo.completed ? Colors.orange : Colors.blueGrey,
                  child: ListTile(
                    title: Text(todo.title),
                    leading: CircleAvatar(
                      child: Text(
                        todo.id.toString(),
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
