class TodoModel {
  String? id;
  String? todoText;
  bool? isDone;

  TodoModel({required this.id, required this.todoText, this.isDone});

  static List<TodoModel> todoList() {
    return [
      TodoModel(id: '1', todoText: 'Buy groceries', isDone: false),
      TodoModel(id: '2', todoText: 'Check Emails', isDone: true),
      TodoModel(id: '3', todoText: 'Practice MVVM Architecture', isDone: false),
      TodoModel(id: "4", todoText: "Post on linkdin", isDone: false)
    ];
  }
}
