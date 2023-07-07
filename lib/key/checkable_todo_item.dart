import 'package:flutter/material.dart';
import 'package:to_do/key/keys.dart';
//import 'package:flutter/scheduler.dart';

enum Priority { urgent, normal, low }

class CheckableTodoItem extends StatefulWidget {
  const CheckableTodoItem(this.text, this.priority, {super.key});

  final String text;
  final Priority priority;
  @override
  State<CheckableTodoItem> createState() {
    return _CheckableTodoItemState();
  }
}

class _CheckableTodoItemState extends State<CheckableTodoItem> {
  var _done = false;
  void _setDone(bool? isChecked) {
    setState(() {
      _done = isChecked ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var icon = Icons.low_priority;
    if (widget.priority == Priority.urgent) {
      icon = Icons.notifications_active;
    }
    if (widget.priority == Priority.normal) {
      icon = Icons.list;
    }
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 12),
          ],
        ),
        Checkbox(title: Text(widget.text), value: value, onChanged: onChanged));
  }
}
