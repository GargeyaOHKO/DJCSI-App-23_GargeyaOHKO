// TODO Implement this library.
import 'package:app/models/todo.dart';
import 'package:flutter/material.dart';

class Todoitem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;
  const Todoitem(
      {super.key,
      required this.todo,
      required this.onDeleteItem,
      required this.onToDoChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      height: 65,
      margin: EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            blurRadius: 15,
          ),
        ],
      ),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.green,
          size: 28,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              decoration: todo.isDone ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 235, 103, 93),
            borderRadius: BorderRadius.circular(90),
          ),
          child: IconButton(
            onPressed: () {
              onDeleteItem(todo.id);
            },
            icon: Icon(Icons.delete),
            color: Colors.white,
            padding: EdgeInsets.symmetric(),
          ),
        ),
      ),
    );
  }
}
