import 'package:appauth/app/data/repositories/github_repository.dart';
import 'package:appauth/app/pages/gitUsers/github_users_controller.dart';
import 'package:appauth/app/pages/gitUsers/github_users_list.dart';
import 'package:appauth/classes/github_user.dart';
import 'package:appauth/components/app_bar.dart';
import 'package:appauth/components/menu_drawer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsuarioGitHub extends StatefulWidget {
  const UsuarioGitHub({super.key});

  @override
  State<UsuarioGitHub> createState() => _UsuarioGitHubState();
}

class _UsuarioGitHubState extends State<UsuarioGitHub> {
  late final GitHubUsersController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        GitHubUsersController(repository: GitHubRepository(dio: Dio()));
    _controller.getGitHubUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppDefaultBar(title: 'Usuarios GitHub'),
      drawer: const MenuDrawer(title: 'Git Users'),
      body: Obx(() {
        return _controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : _controller.users.isEmpty
                ? const Center(child: Text('Sem registro(s)'))
                : ListView.separated(
                    separatorBuilder: (_, __) => const Divider(),
                    itemCount: _controller.users.length,
                    itemBuilder: (_, index) {
                      final user = _controller.users[index];
                      return GitHubUserList(
                        user: GitHubUser(
                            avatarUrl: user.avatarUrl,
                            id: user.id,
                            login: user.login),
                      );
                    },
                  );
      }),
    );
  }
}
