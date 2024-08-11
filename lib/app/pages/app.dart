import 'package:appauth/app/pages/gitUsers/detalhes/detalhes.dart';
import 'package:appauth/app/pages/gitUsers/github_users.dart';
import 'package:appauth/app/pages/home/home.dart';
import 'package:appauth/app/pages/notes/add_nota.dart';
import 'package:appauth/app/pages/notes/edit_nota.dart';
import 'package:appauth/app/pages/notes/notes.dart';
import 'package:appauth/app/pages/todos/todo/todo.dart';
import 'package:appauth/app/pages/todos/todos.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppAuth extends StatelessWidget {
  const AppAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'App Auth',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'git_users',
          name: 'Usuários GitHub',
          builder: (BuildContext context, GoRouterState state) {
            return const UsuarioGitHub();
          },
        ),
        GoRoute(
          path: 'detalhesUsuario/:username',
          builder: (context, state) {
            final username = state.pathParameters['username']!;
            return DetalhesUsuarioGit(username: username);
          },
        ),
        GoRoute(
          path: 'todos',
          builder: (context, state) {
            return const Todos();
          },
        ),
        GoRoute(
          path: 'todoDetalhe/:id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return Todo(id: id);
          },
        ),
        GoRoute(
          path: 'notes',
          builder: (context, state) {
            return const Notes();
          },
        ),
        GoRoute(
          path: 'novaNota',
          builder: (context, state) {
            return const AddNota();
          },
        ),
        GoRoute(
          path: 'note/:id',
          builder: (context, state) {
            final id = int.parse(state.pathParameters['id']!);
            return EditNota(
              id: id,
            );
          },
        ),
      ],
    ),
  ],
);
