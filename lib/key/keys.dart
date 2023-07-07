//import 'dart:js_util';

import 'package:flutter/material.dart';
//import 'package:flutter/scheduler.dart';
import 'package:to_do/key/checkable_todo_item.dart';
//import 'package:to_do/key/todo_item.dart';

class Todo {
  const Todo(this.text, this.priority);

  final String text;
  final Priority priority;
}

class keys extends StatefulWidget {
  const keys({super.key});
  @override
  State<keys> createState() {
    return _keysState();
  }
}

class _keysState extends State<keys> {
  var _order = 'asc';
  final _todos = [
    const Todo(
      'Learn flutter',
      Priority.urgent,
    ),
    const Todo(
      'practice flutter',
      Priority.normal,
    ),
    const Todo(
      'Explore other course',
      Priority.low,
    ),
  ];

  List<Todo> get _orderedTodos {
    final sortedTodos = List.of(_todos);
    sortedTodos.sort((a, b) {
      final bComesAfterA = a.text.compareTo(b.text);
      return _order == 'asc' ? bComesAfterA : -bComesAfterA;
    });
    return sortedTodos;
  }

  void _changeOrder() {
    setState(() {
      _order = _order == 'asc' ? 'desc' : 'asc';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: _changeOrder,
            icon: Icon(
              _order == 'asc' ? Icons.arrow_downward : Icons.arrow_upward,
            ),
            label: Text('sort ${_order == 'asc' ? 'descending' : 'ascending'}'),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              for (final todo in _orderedTodos)
                CheckableTodoItem(
                  key: ValueKey(todo),
                  todo.text,
                  todo.priority,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
