import 'package:appauth/app/data/repositories/note_repository.dart';
import 'package:appauth/app/pages/notes/notes_controller.dart';
import 'package:appauth/components/app_bar.dart';
import 'package:appauth/components/menu_drawer.dart';
import 'package:appauth/components/notes/note_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  late final NotesController _controller;

  @override
  void initState() {
    super.initState();
    _controller = NotesController(repository: NoteRepository());
    _controller.getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppDefaultBar(title: 'Notes'),
      drawer: const MenuDrawer(title: 'Notes'),
      body: Obx(() {
        return _controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : _controller.notes.isEmpty
                ? const Center(child: Text('Sem registro(s)'))
                : ListView.separated(
                    separatorBuilder: (_, __) => const Divider(),
                    itemCount: _controller.notes.length,
                    itemBuilder: (_, index) {
                      final note = _controller.notes[index];
                      return NotesPage(
                        controller: _controller,
                        note: note,
                      );
                    },
                  );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
