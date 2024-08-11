import 'package:appauth/app/data/database/database_helper.dart';
import 'package:appauth/app/data/models/note_model.dart';

class NoteRepository {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<List<NoteModel>> getAllNotes() async {
    final List<Map<String, dynamic>> maps =
        await _databaseHelper.query('notes');
    return List.generate(maps.length, (i) {
      return NoteModel.fromMap(maps[i]);
    });
  }

  Future<int> insertNote(NoteModel note) async {
    return await _databaseHelper.insert('notes', note.toMap());
  }

  Future<NoteModel?> getNoteById(int id) async {
    final List<Map<String, dynamic>> maps = await _databaseHelper
        .query('notes', whereClause: 'id = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return NoteModel.fromMap(maps.first);
    }
    return null;
  }

  Future<int> deleteNote(int id) async {
    return await _databaseHelper.delete('notes', 'id = ?', [id]);
  }

  Future<int> updateNote(NoteModel note) async {
    return await _databaseHelper
        .update('notes', note.toMap(), 'id = ?', [note.id]);
  }
}
