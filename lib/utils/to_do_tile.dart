import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskname;
  final bool taskcompleted;
  final Function(bool?)? onchanged;
  final Function(BuildContext)? deletefunction;
  ToDoTile({
    super.key,
    required this.taskname,
    required this.taskcompleted,
    required this.onchanged,
    required this.deletefunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deletefunction,
              icon: Icons.delete_outline,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          // margin: EdgeInsets.only(right: 12, left: 12, top: 12),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xff011A27),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // check box
              Checkbox(
                value: taskcompleted,
                onChanged: onchanged,
                // checkColor: Color(0xff063852),
                activeColor: Color(0xff063852),
                // splashRadius: 20,
              ),
              //task name
              Text(
                taskname,
                style: TextStyle(
                  color: Colors.white,
                  decoration:
                      taskcompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                  decorationColor: Colors.white,
                  decorationThickness: 2.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
