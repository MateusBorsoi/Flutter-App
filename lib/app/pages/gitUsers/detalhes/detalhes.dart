import 'package:appauth/app/data/repositories/github_repository.dart';
import 'package:appauth/app/pages/gitUsers/detalhes/detalhes_controller.dart';
import 'package:appauth/components/app_bar.dart';
import 'package:appauth/components/menu_drawer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetalhesUsuarioGit extends StatefulWidget {
  final String username;
  const DetalhesUsuarioGit({super.key, required this.username});

  @override
  State<DetalhesUsuarioGit> createState() => _DetalhesUsuarioGitState();
}

class _DetalhesUsuarioGitState extends State<DetalhesUsuarioGit> {
  late final DetalhesController _controller;

  @override
  void initState() {
    super.initState();
    _controller = DetalhesController(repository: GitHubRepository(dio: Dio()));

    _controller.getGitHubUserDetails(username: widget.username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppDefaultBar(title: 'Detalhes'),
      drawer: const MenuDrawer(title: 'Detalhes usuário'),
      body: Obx(() {
        return _controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : _controller.gitHubUser == null
                ? const Center(child: Text('Usuário não encontrado!'))
                : _buildUserInfo();
      }),
    );
  }

  Widget _buildUserInfo() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(_controller.gitHubUser!.avatarUrl,
                height: 275, width: double.infinity, fit: BoxFit.cover),
          ),
          const SizedBox(
            height: 32,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.emoji_people_rounded,
                color: Theme.of(context).colorScheme.primary),
            title: Text('Nome',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold)),
            subtitle: Text(_controller.gitHubUser!.name ?? 'Não informado',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Icons.short_text_rounded,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              'Login',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(_controller.gitHubUser!.login,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold)),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Icons.grain_outlined,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              'Repositórios públicos',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              _controller.gitHubUser!.publicRepos.toString(),
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Icons.people_rounded,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              'Seguidores',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              _controller.gitHubUser!.followers.toString(),
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Icons.flag_rounded,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              'Local',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              _controller.gitHubUser!.location ?? "Não informadoF",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
