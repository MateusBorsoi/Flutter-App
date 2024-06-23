import 'package:appauth/app/pages/gitUsers/detalhes/detalhes.dart';
import 'package:appauth/app/pages/gitUsers/github_users.dart';
import 'package:appauth/app/pages/home/home.dart';
import 'package:appauth/theme/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppAuth extends StatelessWidget {
  const AppAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'App Auth',
      theme: lightThemeData,
      darkTheme: darkThemeData,
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
      ],
    ),
  ],
);
