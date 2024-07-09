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

  bool isValid(String value) {
    return value.isNotEmpty;
  }

  void handleChangeTitulo(String value) {
    tituloController.text = value;
    if (tituloController.text.isNotEmpty) {
      if (tituloController.text.length < 3) {
        tituloError.value = true;
        tituloErrorText.value = 'Mínimo 3 caractéres';
      }
      return;
    }
    tituloError.value = false;
    tituloErrorText.value = '';
  }

  void handleChangeDescricao(String value) {
    descricaoController.text = value;
    if (descricaoController.text.isNotEmpty) {
      if (descricaoController.text.length < 3) {
        descricaoError.value = true;
        descricaoErrorText.value = 'Mínimo 6 caractéres';
      }
    } else {
      descricaoError.value = false;
      descricaoErrorText.value = '';
    }
  }

  void validade() {
    if (!isValid(tituloController.text)) {
      tituloError.value = true;
      tituloErrorText.value = 'Campo obrigatório';
    } else if (!isValid(descricaoController.text)) {
      descricaoError.value = true;
      descricaoErrorText.value = 'Campo obrigatório';
    }
    if (tituloController.text.length < 3) {
      tituloError.value = true;
      tituloErrorText.value = 'Mínimo 3 caractéres';
    } else if (descricaoController.text.length < 6) {
      descricaoError.value = true;
      descricaoErrorText.value = 'Mínimo 6 caractéres';
      return;
    }
  }

  void submitForm() async {
    validade();
    if (!tituloError.value && !descricaoError.value) {
      try {
        await _noteRepository.insertNote(NoteModel(
            title: tituloController.text,
            description: descricaoController.text));
        Get.snackbar('Sucesso', 'Nota salva com sucesso!');
      } catch (err) {
        Get.snackbar('Erro', 'Falha ao gravar dados, motivo: $err');
      }
    }
  }
}
