import 'package:appauth/app/data/models/todos_model.dart';
import 'package:appauth/app/data/repositories/todos_respository.dart';
import 'package:appauth/app/pages/todos/todos_controller.dart';
import 'package:appauth/classes/components/todos/todos_list.dart';
import 'package:appauth/components/app_bar.dart';
import 'package:appauth/components/menu_drawer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Todos extends StatefulWidget {
  const Todos({super.key});

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  late final TodosController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TodosController(repository: TodosRepository(dio: Dio()));
    _controller.getTodosList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppDefaultBar(title: 'Todos'),
      drawer: const MenuDrawer(title: 'Todos'),
      body: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Obx(
            () {
              return _controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : _controller.todos.isEmpty
                      ? const Center(child: Text('Sem registro(s)'))
                      : ListView.separated(
                          separatorBuilder: (_, __) => const Divider(),
                          itemCount: _controller.todos.length,
                          itemBuilder: (_, index) {
                            final todo = _controller.todos[index];
                            return TodosList(
                                todosModel: TodosModel(
                                    userId: todo.id,
                                    id: todo.id,
                                    title: todo.title,
                                    completed: todo.completed));
                          },
                        );
            },
          )),
    );
  }
}
