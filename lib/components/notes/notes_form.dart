import 'package:appauth/classes/enum/notes_enum.dart';
import 'package:appauth/components/notes/notes_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotesForm extends StatefulWidget {
  final String formTitle;
  final FloatingLabelBehavior floatingLabel;
  final int? id;
  final FormAction action;
  const NotesForm(
      {super.key,
      this.id,
      required this.action,
      required this.formTitle,
      required this.floatingLabel});

  @override
  State<NotesForm> createState() => _NotesFormState();
}

class _NotesFormState extends State<NotesForm> {
  final NotesFormController notesFormController =
      Get.put(NotesFormController());

  @override
  void dispose() {
    notesFormController.clearValues();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.action == FormAction.editar) {
      if (widget.id != null) {
        notesFormController.getDefaultValuesById(widget.id!);
      }
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(widget.formTitle,
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
            Obx(
              () => TextField(
                controller: notesFormController.tituloController,
                decoration: InputDecoration(
                    floatingLabelBehavior: widget.floatingLabel,
                    errorText: notesFormController.tituloErrorText.value,
                    border: const OutlineInputBorder(),
                    label: const Text('Título')),
                onChanged: (value) {
                  notesFormController.handleChangeTitulo(value);
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Obx(
                  () => TextField(
                    minLines: 3,
                    maxLines: 5,
                    controller: notesFormController.descricaoController,
                    decoration: InputDecoration(
                        floatingLabelBehavior: widget.floatingLabel,
                        errorText: notesFormController.descricaoErrorText.value,
                        border: const OutlineInputBorder(),
                        label: const Text('Descrição')),
                    onChanged: (value) {
                      notesFormController.handleChangeDescricao(value);
                    },
                  ),
                )),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: FilledButton(
                  child: const Text('Salvar'),
                  onPressed: () {
                    notesFormController.submitForm(
                        widget.action, context, widget.id);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
