import 'package:appauth/app/data/models/github_user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GitHubRepository {
  final Dio dio;
  String baseUrl = dotenv.get('GIT_API_BASEURL');
  GitHubRepository({required this.dio});

  Future<List<GitHubUserModel>> getGitHubUsers() async {
    final result = await dio.get("$baseUrl/users");

    final List<GitHubUserModel> users = [];

    if (result.statusCode == 200) {
      result.data
          .map((item) => users.add(GitHubUserModel.fromMap(item)))
          .toList();
    }
    return users;
  }
}
