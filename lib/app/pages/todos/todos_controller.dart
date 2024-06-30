import 'package:appauth/app/data/models/todos_model.dart';
import 'package:appauth/app/data/repositories/todos_respository.dart';
import 'package:get/get.dart';

class TodosController extends GetxController {
  final TodosRepository repository;
  final List<TodosModel> _todos = <TodosModel>[].obs;

  List<TodosModel> get todos => _todos;

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  TodosController({required this.repository});

  getTodosList() async {
    _isLoading.value = true;

    final response = await repository.getTodos();

    _todos.addAll(response);

    _isLoading.value = false;
  }
}
