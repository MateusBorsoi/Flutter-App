import 'package:appauth/app/pages/gitUsers/github_users.dart';
import 'package:appauth/app/pages/home/home.dart';
import 'package:appauth/theme/theme_config.dart';
import 'package:flutter/material.dart';

class AppAuth extends StatelessWidget {
  const AppAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Auth',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/git_users': (context) => const Githubusers()
      },
    );
  }
}
