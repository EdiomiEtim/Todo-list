import 'package:flutter/material.dart';
import 'package:to_do_list/utils/dialogbox.dart';
import 'package:to_do_list/utils/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // text contoller
  final _contoller = TextEditingController();
  //to do list
  List todolist = [
    ['Do Exercise', false],
    ['Make Breakfast', false],
  ];
  // checkbox was tap
  void checkboxchanged(bool? value, int index) {
    setState(() {
      todolist[index][1] = !todolist[index][1];
    });
  }

  //save task to todo list
  void savenewtask() {
    setState(() {
      todolist.add([_contoller.text, false]);
      _contoller.clear();
    });
    Navigator.of(context).pop();
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
            taskname: todolist[index][0],
            taskcompleted: todolist[index][1],
            onchanged: (value) => checkboxchanged(value, index),
          );
        },
        itemCount: todolist.length,
      ),
    );
  }
}
