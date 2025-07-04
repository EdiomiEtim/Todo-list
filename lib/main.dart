import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/pages/home_page.dart';

void main() async {
  // initailize hive
  await Hive.initFlutter();
  // open a box
  var box = await Hive.openBox('todolistbox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primaryColor: Color(0xff011A27)),
    );
  }
}
