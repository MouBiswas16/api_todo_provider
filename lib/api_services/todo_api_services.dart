import 'dart:convert';

import '../model/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoApiServices {
  Future<List<TodoModel>> getAll() async {
    var url = "https://jsonplaceholder.typicode.com/todos";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final todos = json.map((items) {
        return TodoModel(
          id: items["id"],
          userId: items["userId"],
          title: items["title"],
          completed: items["completed"],
        );
      }).toList();
      return todos;
    }
    // throw something if you want to handle errors
    return [];
  }
}
