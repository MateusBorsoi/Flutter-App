import 'package:appauth/app/data/models/todos_model.dart';
import 'package:appauth/app/data/repositories/todos_respository.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  final TodosRepository repository;

  TodosModel? _todo;
  TodosModel? get todo => _todo;

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  TodoController({required this.repository});

  getTodoDetail({required String id}) async {
    _isLoading.value = true;

    final result = await repository.getTodo(id: id);
    _todo = result;
    _isLoading.value = false;
  }
}
