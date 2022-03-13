// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:note_clean_architecture/application/notes/note_form/note_form_bloc.dart';
import 'package:note_clean_architecture/domain/notes/value_objects.dart';

class BodyField extends HookWidget {
  const BodyField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textEdtinController = useTextEditingController();
    return BlocListener<NoteFormBloc, NoteFormState>(
      listenWhen: (p, c) => p.isEditing != c.isEditing,
      listener: (context, state) {
        textEdtinController.text = state.note.body.getOrCrash();
        // TODO: implement listener
      },
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            controller: textEdtinController,
            decoration: InputDecoration(
              labelText: 'Note',
              counterText: '',
              errorStyle: TextStyle(
                color: Colors.red[400],
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            maxLength: NoteBody.maxLength,
            maxLines: null,
            minLines: 5,
            onChanged: (value) => context
                .bloc<NoteFormBloc>()
                .add(NoteFormEvent.bodyChanged(value)),
            validator: (_) => context
                .bloc<NoteFormBloc>()
                .state
                .note
                .body
                .value
                .fold(
                  (f) => f.maybeMap(
                    empty: (f) => 'Cannot be empty',
                    exceedingLength: (f) => 'Exceeding length, max: ${f.max}',
                    orElse: () => null,
                  ),
                  (r) => null,
                ),
          )),
    );
  }
}
