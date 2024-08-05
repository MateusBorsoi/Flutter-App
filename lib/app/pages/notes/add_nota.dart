import 'package:appauth/components/app_bar.dart';
import 'package:appauth/components/menu_drawer.dart';
import 'package:appauth/components/notes/notes_form.dart';
import 'package:flutter/material.dart';

class AddNota extends StatefulWidget {
  const AddNota({super.key});

  @override
  State<AddNota> createState() => _AddNotaState();
}

class _AddNotaState extends State<AddNota> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: AppDefaultBar(title: 'Notes'),
        drawer: MenuDrawer(title: 'Notes'),
        body: NotesForm());
  }
}
