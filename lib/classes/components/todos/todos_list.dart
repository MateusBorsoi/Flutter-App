import 'package:appauth/app/data/models/todos_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TodosList extends StatefulWidget {
  final TodosModel todosModel;
  const TodosList({super.key, required this.todosModel});

  @override
  State<TodosList> createState() => _TodosListState();
}

class _TodosListState extends State<TodosList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(widget.todosModel.id.toString()),
          subtitle: Text(widget.todosModel.title),
          trailing: Icon(
              widget.todosModel.completed ? Icons.check : Icons.close,
              color: widget.todosModel.completed ? Colors.green : Colors.red),
          onTap: () {
            context.go('/todoDetalhe/${widget.todosModel.id}');
          },
        )
      ],
    );
  }
}
