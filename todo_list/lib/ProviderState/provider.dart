import 'package:flutter/foundation.dart';
import 'package:todo_list/model/todo_model.dart';

class ProviderManagement with ChangeNotifier {
  List<TodoModel> todosList = TodoModel.todoList();
  String _searchQuery = '';

  List<TodoModel> get filteredTodos {
    if (_searchQuery.isEmpty) {
      return todosList;
    }
    return todosList
        .where((todo) =>
            todo.todoText!.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  void handleToDoChange(TodoModel todo) {
    todo.isDone = !todo.isDone!;
    notifyListeners();
  }

  void deleteTodo(String id) {
    todosList.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }

  void addTodoItem(TodoModel todo) {
    todosList.add(todo);
    notifyListeners();
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }
}
