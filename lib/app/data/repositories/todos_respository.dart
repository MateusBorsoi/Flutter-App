import 'package:appauth/app/data/models/todos_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TodosRepository {
  final Dio dio;
  String baseUrl = dotenv.get('PLACEHOLDER_BASEURL');

  TodosRepository({required this.dio});

  Future<List<TodosModel>> getTodos() async {
    final result = await dio.get('$baseUrl/todos');

    final List<TodosModel> todos = [];

    if (result.statusCode == 200) {
      result.data.map((item) => todos.add(TodosModel.fromMap(item))).toList();
    }
    return todos;
  }

  Future<TodosModel> getTodo({required String id}) async {
    final result = await dio.get('$baseUrl/todos/$id');

    late TodosModel todo;

    if (result.statusCode == 200) {
      todo = TodosModel.fromMap(result.data);
    }
    return todo;
  }
}
