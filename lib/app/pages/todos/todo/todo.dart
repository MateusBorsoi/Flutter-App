import 'package:appauth/app/data/repositories/todos_respository.dart';
import 'package:appauth/app/pages/todos/todo/todo_controller.dart';
import 'package:appauth/components/app_bar.dart';
import 'package:appauth/components/menu_drawer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Todo extends StatefulWidget {
  final String id;
  const Todo({super.key, required this.id});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  late final TodoController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TodoController(repository: TodosRepository(dio: Dio()));
    _controller.getTodoDetail(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppDefaultBar(title: 'Todo'),
        drawer: const MenuDrawer(title: 'Todo'),
        body: Obx(
          () {
            return _controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : _controller.todo == null
                    ? const Center(child: Text('Nenhum registro encontrado'))
                    : ListTile(
                        title: Text(_controller.todo!.id.toString()),
                        subtitle: Text(_controller.todo!.title),
                        trailing: Icon(
                            _controller.todo!.completed
                                ? Icons.check
                                : Icons.close,
                            color: _controller.todo!.completed
                                ? Colors.green
                                : Colors.red),
                      );
          },
        ));
  }
}
