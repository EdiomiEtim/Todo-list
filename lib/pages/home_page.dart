import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_list/utils/dialogbox.dart';
import 'package:to_do_list/utils/to_do_tile.dart';
import 'package:to_do_list/data/todo_databdase.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // refeerence hive db
  final _todolistbox = Hive.box('todolistbox');
  TodoDatabdase db = TodoDatabdase();

  @override
  void initState() {
    // TODO: implement initState
    if (_todolistbox.get('TODOLIST') == null) {
      db.createInitalData();
    } else {
      db.loadDataBase();
    }
    super.initState();
  }

  // text contoller
  final _contoller = TextEditingController();

  // checkbox was tap
  void checkboxchanged(bool? value, int index) {
    setState(() {
      db.todolist[index][1] = !db.todolist[index][1];
    });
    db.updateDataBase();
  }

  //save task to todo list
  void savenewtask() {
    setState(() {
      db.todolist.add([_contoller.text, false]);
      _contoller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  // add new task
  void createnewtask() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialogbox(
          controller: _contoller,
          save: savenewtask,
          cancel: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  //deletetask
  void deletetask(int index) {
    setState(() {
      db.todolist.removeAt(index);
    });
    db.updateDataBase();
  }

  // savetodo list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff063852),
      appBar: AppBar(
        title: Text('To-Do List', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xff011A27),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff011A27),
        onPressed: () {
          createnewtask();
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ToDoTile(
            taskname: db.todolist[index][0],
            taskcompleted: db.todolist[index][1],
            onchanged: (value) => checkboxchanged(value, index),
            deletefunction: (context) {
              deletetask(index);
            },
          );
        },
        itemCount: db.todolist.length,
      ),
    );
  }
}
