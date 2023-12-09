import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  // reference the box
  final _myBox = Hive.box('mybox');

  //run this method if first time ever opening aoop
  void createInitialData() {
    toDoList = [
      ["Make Bed", false],
      ["Do Exercise", false],
    ];
  }

  //load data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
