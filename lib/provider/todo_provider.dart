import 'package:api_todo_provider/api_services/todo_api_services.dart';
import 'package:api_todo_provider/model/todo_model.dart';
import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  final _service = TodoApiServices();
  // bool isLoading = false;
  List<TodoModel> _todos = [];
  List<TodoModel> get todos => _todos;

  Future<void> getAllTodo() async {
    // isLoading = true;
    // notifyListeners();

    _todos = await _service.getAll();
    // isLoading = false;
    notifyListeners();
  }
}
