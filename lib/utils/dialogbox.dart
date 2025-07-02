import 'package:flutter/material.dart';
import 'package:to_do_list/utils/my_button.dart';

class Dialogbox extends StatelessWidget {
  final controller;
  VoidCallback save;
  VoidCallback cancel;
  Dialogbox({
    super.key,
    required this.controller,
    required this.cancel,
    required this.save,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xff063852),
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get user input
            TextField(
              controller: controller,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Add new task',
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff011A27)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff011A27)),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // save button
                MyButton(buttonname: 'Save', onpressed: save),
                // Cancel button
                MyButton(buttonname: 'Cancel', onpressed: cancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
