import 'package:app/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'widgets/todoitem.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  final _todoController = TextEditingController();

  

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 244, 209),
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                //searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        child: Text(
                          "Your Tasks For Today:",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      for (ToDo obj in todosList)
                        Todoitem(
                          todo: obj,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),
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
                      height: 70,
                      margin: EdgeInsets.only(
                        bottom: 40,
                        right: 20,
                        left: 20,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(30)),
                      child: TextField(
                        controller: _todoController,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          hintText: "Add a new task here",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 22, vertical: 20),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 15,
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(bottom: 40, right: 20),
                    child: ElevatedButton(
                      child: Text(
                        "+",
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                      onPressed: () {
                        _addtodoItem(_todoController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 138, 197, 130),
                        minimumSize: Size(60, 60),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id==id);
    });
  }

  void _addtodoItem(String todo) {
    setState(() {
      todosList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: todo,
          ));
    });
    _todoController.clear();
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      toolbarHeight: 70,
      automaticallyImplyLeading: false,
      backgroundColor: Color.fromARGB(255, 247, 226, 155),
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Icon(
          Icons.accessibility_sharp,
          color: Colors.black,
          size: 30,
        ),
        Text(
          "FocusList",
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        Container(
          height: 40,
          width: 40,
          child: ClipRRect(
            child: Image.asset("assets/images/Profile.png"),
            borderRadius: BorderRadius.circular(100),
          ),
        )
      ]),
    );
  }
}
