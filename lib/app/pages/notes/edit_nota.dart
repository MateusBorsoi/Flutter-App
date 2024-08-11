import 'package:appauth/classes/enum/notes_enum.dart';
import 'package:appauth/components/app_bar.dart';
import 'package:appauth/components/menu_drawer.dart';
import 'package:appauth/components/notes/notes_form.dart';
import 'package:flutter/material.dart';

class EditNota extends StatefulWidget {
  final int id;
  const EditNota({super.key, required this.id});

  @override
  State<EditNota> createState() => _EditNotaState();
}

class _EditNotaState extends State<EditNota> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: AppDefaultBar(title: 'Editar Nota'),
        drawer: MenuDrawer(title: 'Editar Nota'),
        body: NotesForm(action: FormAction.editar, formTitle: 'Editar nota'));
  }
}
