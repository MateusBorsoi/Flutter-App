import 'package:appauth/app/data/models/note_model.dart';
import 'package:appauth/app/data/repositories/note_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotesFormController extends GetxController {
  final NoteRepository _noteRepository = NoteRepository();
  late final TextEditingController tituloController;
  late final TextEditingController descricaoController;
  final tituloErrorText = ''.obs;
  final descricaoErrorText = ''.obs;

  RxBool tituloError = false.obs;
  RxBool descricaoError = false.obs;

  @override
  void onInit() {
    super.onInit();
    tituloController = TextEditingController();
    descricaoController = TextEditingController();
  }

  @override
  void onClose() {
    tituloController.dispose();
    descricaoController.dispose();
    super.onClose();
  }

  void isValidTitle(String value) {
    if (value.isEmpty) {
      tituloError.value = true;
      tituloErrorText.value = 'Campo obrigatório';
    }
    tituloErrorText.value = '';
    tituloError.value = false;
  }

  void isValidDescricao(String value) {
    if (value.isEmpty) {
      descricaoError.value = true;
      descricaoErrorText.value = 'Campo obrigatório';
    } else {
      descricaoError.value = false;
      descricaoErrorText.value = '';
    }
  }

  void submitForm() {
    try {
      _noteRepository.insertNote(NoteModel(
          title: tituloController.text, description: descricaoController.text));
      Get.snackbar('Sucesso', 'Nota salva com sucesso!');
    } catch (err) {
      Get.snackbar('Erro', 'Falha ao gravar dados, motivo: $err');
    }

    return;
  }
}
