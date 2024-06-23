import 'package:appauth/components/app_bar.dart';
import 'package:appauth/components/menu_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppDefaultBar(
        title: 'App Auth',
      ),
      drawer: MenuDrawer(title: 'App Auth'),
    );
  }
}
