import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/ProviderState/provider.dart';
import 'package:todo_list/constants/colors.dart';
import 'package:todo_list/model/todo_model.dart';
import 'package:todo_list/widgets/searchBox.dart';
import 'package:todo_list/widgets/todo_item.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderManagement>(context);
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: tdBlack,
              size: 30,
            ),
            Container(
              height: 40,
              width: 40,
              child: ClipRRect(
                child: Image.asset("assets/images/picofme (1).png"),
              ),
            )
          ],
        ),
        backgroundColor: tdBGColor,
      ),
      body: Consumer<ProviderManagement>(
        builder: (context, value, child) {
          return Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  children: [
                    SearchBox(),
                    Expanded(
                      child: ListView(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 50, bottom: 20),
                            child: Text(
                              "All ToDos",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w500),
                            ),
                          ),
                          for (TodoModel todoo in value.filteredTodos)
                            TodoItem(
                                todo: todoo,
                                onToDoChanged: value.handleToDoChange,
                                onDeleteItem: value.deleteTodo),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin:
                            EdgeInsets.only(bottom: 20, right: 20, left: 20),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 10.0,
                                spreadRadius: 0.0),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: _todoController,
                          decoration: InputDecoration(
                              hintText: "Add a new todo item",
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20, right: 20),
                      child: InkWell(
                        onTap: () {
                          if (_todoController.text.isNotEmpty) {
                            final newTodo = TodoModel(
                              id: DateTime.now().toString(),
                              todoText: _todoController.text,
                              isDone: false,
                            );
                            provider.addTodoItem(newTodo);
                            _todoController.clear();
                          }
                        },
                        child: Icon(Icons.add, color: tdBlue, size: 40),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
