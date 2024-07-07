import 'package:appauth/classes/components/notes/notes_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotesForm extends StatefulWidget {
  const NotesForm({super.key});

  @override
  State<NotesForm> createState() => _NotesFormState();
}

class _NotesFormState extends State<NotesForm> {
  @override
  Widget build(BuildContext context) {
    final NotesFormController notesFormController =
        Get.put(NotesFormController());

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text('Cadastrar nota',
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
            Obx(
              () => TextField(
                decoration: InputDecoration(
                    errorText: notesFormController.tituloErrorText as String,
                    border: const OutlineInputBorder(),
                    label: const Text('Título')),
                onChanged: (value) {
                  (value) => notesFormController.isValidTitle(value);
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Obx(
                  () => TextField(
                    minLines: 3,
                    maxLines: 5,
                    decoration: InputDecoration(
                        errorText:
                            notesFormController.descricaoErrorText as String,
                        border: const OutlineInputBorder(),
                        label: const Text('Descrição')),
                    onChanged: (value) {
                      notesFormController.isValidDescricao(value);
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
                    notesFormController.submitForm();
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
