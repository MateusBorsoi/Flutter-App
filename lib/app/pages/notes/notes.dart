import 'package:appauth/components/notes/notes_form.dart';
import 'package:appauth/components/app_bar.dart';
import 'package:appauth/components/menu_drawer.dart';
import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppDefaultBar(title: 'Notes'),
      drawer: MenuDrawer(title: 'Notes'),
      body: NotesForm(),
    );
  }
}
