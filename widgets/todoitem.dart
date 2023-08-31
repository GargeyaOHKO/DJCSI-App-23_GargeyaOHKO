import 'package:flutter/material.dart';
 
class Todoitem extends StatelessWidget {
  const Todoitem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: (){},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal:20,vertical:5),
        tileColor: Colors.white,
        leading: Icon(
          Icons.check_box,
          color: Colors.deepPurple,
        ),
        title: Text(
          "Check Mail",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            decoration: TextDecoration.lineThrough,
          ),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(onPressed: (){
            print("Deleted");
          },color: Colors.white,iconSize: 18, icon: Icon(Icons.delete),),
        ),
      ),
    );
  }
}