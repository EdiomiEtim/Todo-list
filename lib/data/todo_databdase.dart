import 'package:hive/hive.dart';

class TodoDatabdase {
  List todolist = [];

  final _todolistbox = Hive.box('todolistbox');

  // default tasks for first time users
  void createInitalData() {
    todolist = [
      ['20min Do Exercise', false],
      ['Make breakfast', false],
    ];
  }

  // loading user data
  void loadDataBase() {
    todolist = _todolistbox.get('TODOLIST');
  }

  // update useer database
  void updateDataBase() {
    _todolistbox.put('TODOLIST', todolist);
  }
}
