import 'package:appauth/app/data/models/note_model.dart';
import 'package:appauth/app/data/repositories/note_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotesFormController extends GetxController {
  final NoteRepository _noteRepository = NoteRepository();
  late final TextEditingController tituloController;
  late final TextEditingController descricaoController;
  final RxnString tituloErrorText = RxnString();
  final RxnString descricaoErrorText = RxnString();

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

  void clearValues() {
    tituloController.clear();
    descricaoController.clear();
    tituloErrorText.value = null;
    descricaoErrorText.value = null;
    tituloError.value = false;
    descricaoError.value = false;
  }

  void submitForm() async {
    validate();
    if (!tituloError.value && !descricaoError.value) {
      try {
        await _noteRepository.insertNote(NoteModel(
            title: tituloController.text,
            description: descricaoController.text));
        clearValues();
        Get.snackbar('Sucesso', 'Nota salva com sucesso!',
            colorText: Colors.green);
      } catch (err) {
        Get.snackbar('Erro', 'Falha ao gravar dados, motivo: $err',
            colorText: Colors.red);
      }
    }
  }
}
