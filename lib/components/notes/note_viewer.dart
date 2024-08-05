import 'package:appauth/app/data/models/note_model.dart';
import 'package:appauth/app/pages/notes/notes_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotesPage extends StatefulWidget {
  final NoteModel note;
  final NotesController controller;

  const NotesPage({super.key, required this.note, required this.controller});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.note.title,
        style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      ),
      subtitle: Text(
        widget.note.description ?? widget.note.description.toString(),
        style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 22,
            fontWeight: FontWeight.bold),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              context.go('/note/${widget.note.id}');
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
              onPressed: () {
                if (widget.note.id != null) {
                  setState(() {
                    widget.controller.deleteNoteById(widget.note.id ?? 0);
                  });
                }
              },
              icon: const Icon(Icons.delete, color: Colors.red))
        ],
      ),
    );
  }
}
