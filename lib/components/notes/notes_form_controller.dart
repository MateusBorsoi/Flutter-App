import 'package:appauth/app/data/models/note_model.dart';
import 'package:appauth/app/data/repositories/note_repository.dart';
import 'package:appauth/classes/enum/notes_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class NotesFormController extends GetxController {
  final NoteRepository _noteRepository = NoteRepository();
  late final TextEditingController tituloController;
  late final TextEditingController descricaoController;
  final RxnString tituloErrorText = RxnString();
  final RxnString descricaoErrorText = RxnString();

  RxBool tituloError = false.obs;
  RxBool descricaoError = false.obs;

  @override
  void onInit() async {
    super.onInit();
    tituloController = TextEditingController();
    descricaoController = TextEditingController();
  }

  void clearValues() {
    tituloController.clear();
    descricaoController.clear();
    tituloErrorText.value = null;
    descricaoErrorText.value = null;
    tituloError.value = false;
    descricaoError.value = false;
  }

  void handleChangeTitulo(String value) {
    tituloController.text = value;
    if (tituloController.text.isNotEmpty) {
      if (tituloController.text.length < 3) {
        tituloError.value = true;
        tituloErrorText.value = 'Mínimo 3 caractéres';
        return;
      }
    }
    tituloError.value = false;
    tituloErrorText.value = null;
  }

  void handleChangeDescricao(String value) {
    descricaoController.text = value;
    if (descricaoController.text.isNotEmpty) {
      if (descricaoController.text.length < 6) {
        descricaoError.value = true;
        descricaoErrorText.value = 'Mínimo 6 caractéres';
        return;
      }
    }
    descricaoError.value = false;
    descricaoErrorText.value = null;
  }

  void getDefaultValuesById(int id) async {
    try {
      final note = await _noteRepository.getNoteById(id);
      tituloController.text = note!.title;
      descricaoController.text = note.description!;
    } catch (e) {
      Get.snackbar('Erro', 'Falha ao obter dados, motivo: $e',
          colorText: Colors.red);
    }
  }

  void validate() {
    if (tituloController.text.isEmpty) {
      tituloError.value = true;
      tituloErrorText.value = 'Campo obrigatório';
    } else if (tituloController.text.length < 3) {
      tituloError.value = true;
      tituloErrorText.value = 'Mínimo 3 caractéres';
    }
    if (descricaoController.text.isEmpty) {
      descricaoError.value = true;
      descricaoErrorText.value = 'Campo obrigatório';
    } else if (descricaoController.text.length < 6) {
      descricaoError.value = true;
      descricaoErrorText.value = 'Mínimo 6 caractéres';
      return;
    }
  }

  Future<void> submitForm(
      FormAction action, BuildContext context, int? id) async {
    validate();
    if (!tituloError.value && !descricaoError.value) {
      if (action == FormAction.gravar) {
        try {
          await _noteRepository.insertNote(NoteModel(
              title: tituloController.text,
              description: descricaoController.text));
          clearValues();
          Get.snackbar('Sucesso', 'Nota salva com sucesso!',
              colorText: Colors.green);
          if (context.mounted) {
            GoRouter.of(context).go('/notes');
          }
        } catch (err) {
          Get.snackbar('Erro', 'Falha ao gravar dados, motivo: $err',
              colorText: Colors.red);
        }
      }
      if (action == FormAction.editar) {
        try {
          await _noteRepository.updateNote(NoteModel(
              id: id,
              title: tituloController.text,
              description: descricaoController.text));
          Get.snackbar('Sucesso', 'Nota atualizada com sucesso!',
              colorText: Colors.green);
          if (context.mounted) {
            GoRouter.of(context).go('/notes');
          }
          clearValues();
        } catch (e) {
          Get.snackbar('Erro', 'Falha ao editar dados, motivo: $e',
              colorText: Colors.red);
        }
      }
    }
  }
}
