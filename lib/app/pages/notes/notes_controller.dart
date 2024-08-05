import 'package:appauth/app/data/models/note_model.dart';
import 'package:appauth/app/data/repositories/note_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotesController extends GetxController {
  final NoteRepository repository;
  final List<NoteModel> _notes = <NoteModel>[].obs;
  final _note = Rxn<NoteModel>();

  List<NoteModel> get notes => _notes;
  NoteModel? get note => _note.value;

  final RxBool _isLoading = false.obs;
  final RxBool _isRemoving = false.obs;
  final RxBool _isUpdating = false.obs;

  RxBool get isLoading => _isLoading;
  RxBool get isRemoving => _isRemoving;
  RxBool get isUpdating => _isUpdating;

  NotesController({required this.repository});

  Future<void> getTodosList() async {
    _isLoading.value = true;
    try {
      final response = await repository.getAllNotes();
      _notes.assignAll(response);
      _isLoading.value = false;
    } catch (e) {
      Get.snackbar('Falha', 'Falha ao obter notas, motivo: $e',
          colorText: Colors.red);
      _isLoading.value = false;
    }
    _isLoading.value = false;
  }

  Future<void> getTodosById(int id) async {
    _isLoading.value = true;
    try {
      final response = await repository.getNoteById(id);
      _note.value = response;
      _isLoading.value = false;
    } catch (e) {
      Get.snackbar('Falha', 'Falha ao obter nota, motivo: $e',
          colorText: Colors.red);
      _isLoading.value = false;
    }
    _isLoading.value = false;
  }

  Future<void> deleteById(int id) async {
    _isRemoving.value = true;
    try {
      await repository.deleteNote(id);
      Get.snackbar('Sucesso', 'Nota removida com sucesso!',
          colorText: Colors.green);
      _isRemoving.value = false;
    } catch (e) {
      Get.snackbar('Falha', 'Falha ao remover nota, motivo: $e',
          colorText: Colors.red);
      _isRemoving.value = false;
    }
    _isRemoving.value = false;
  }

  Future<void> updateNote(NoteModel note) async {
    _isUpdating.value = true;
    try {
      await repository.updateNote(note);
      Get.snackbar('Sucesso', 'Nota atualizada com sucesso!',
          colorText: Colors.green);
      _isUpdating.value = false;
    } catch (e) {
      Get.snackbar('Falha', 'Falha ao atualizar nota, motivo: $e',
          colorText: Colors.red);
      _isUpdating.value = false;
    }
    _isUpdating.value = false;
  }
}
