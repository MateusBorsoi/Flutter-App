import 'package:appauth/app/data/models/github_user_model.dart';
import 'package:appauth/app/data/repositories/github_repository.dart';
import 'package:get/get.dart';

class DetalhesController extends GetxController {
  final GitHubRepository repository;

  GitHubUserModel? _githubUser;
  GitHubUserModel? get gitHubUser => _githubUser;

  final RxBool _isLoading = false.obs;

  RxBool get isLoading => _isLoading;

  DetalhesController({required this.repository});

  getGitHubUserDetails({required String username}) async {
    _isLoading.value = true;

    final result = await repository.getGitHubUserDetails(username: username);
    _githubUser = result;

    _isLoading.value = false;
  }
}
