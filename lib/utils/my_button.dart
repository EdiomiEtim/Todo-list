import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonname;
  final VoidCallback onpressed;
  MyButton({super.key, required this.buttonname, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      color: Color(0xff011A27),
      child: Text(buttonname, style: TextStyle(color: Colors.white)),
    );
  }
}
