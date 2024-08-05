import 'package:appauth/app/data/repositories/note_repository.dart';
import 'package:appauth/app/pages/notes/notes_controller.dart';
import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late final NotesController _controller;

  @override
  void initState() {
    super.initState();
    _controller = NotesController(repository: NoteRepository());
    _controller.getTodosList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            'Notas',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ],
    );
  }
}
