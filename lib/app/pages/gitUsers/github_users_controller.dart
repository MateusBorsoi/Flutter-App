import 'package:appauth/app/data/models/github_user_model.dart';
import 'package:appauth/app/data/repositories/github_repository.dart';
import 'package:get/get.dart';

class GitHubUsersController extends GetxController {
  final GitHubRepository repository;
  final List<GitHubUserModel> _users = <GitHubUserModel>[].obs;

  List<GitHubUserModel> get users => _users;

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  GitHubUsersController({required this.repository});

  getGitHubUsers() async {
    _isLoading.value = true;
    final response = await repository.getGitHubUsers();

    _users.addAll(response);

     _isLoading.value = false;
  }
}
