class ToDo{
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone=false,
  });
  static List<ToDo> todoList(){
    return[
      ToDo(id: "01", todoText: 'Excercise',),
      ToDo(id: "02", todoText: 'Yoga',),
      ToDo(id: "03", todoText: 'Valorant',),
      ToDo(id: "04", todoText: 'Surfing',),
      ToDo(id: "05", todoText: 'Walking',),


    ];
  }
}