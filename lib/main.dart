// ignore_for_file: prefer_const_constructors

import 'package:api_todo_provider/provider/todo_provider.dart';
import 'package:api_todo_provider/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TodoProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: HomeScreen(),
      ),
    );
  }
}
