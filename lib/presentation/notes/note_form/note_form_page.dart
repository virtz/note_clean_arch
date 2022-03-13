import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_clean_architecture/application/notes/note_form/note_form_bloc.dart';
import 'package:note_clean_architecture/domain/notes/note.dart';
import 'package:note_clean_architecture/injection.dart';
import 'package:note_clean_architecture/presentation/notes/note_form/misc/todo_item_presentation_classes.dart';
import 'package:note_clean_architecture/presentation/notes/note_form/widgetss/add_todo_tile.dart';
import 'package:note_clean_architecture/presentation/notes/note_form/widgetss/body_field_widget.dart';
import 'package:note_clean_architecture/presentation/notes/note_form/widgetss/color_field_widget.dart';
import 'package:note_clean_architecture/presentation/notes/note_form/widgetss/todo_list_widget.dart';
import 'package:note_clean_architecture/presentation/routes/router.gr.dart';
import 'package:provider/provider.dart';

class NoteFormPage extends StatelessWidget {
  const NoteFormPage({Key key, this.editedNote}) : super(key: key);

  final Note editedNote;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NoteFormBloc>()
        ..add(NoteFormEvent.initialized(optionOf(editedNote))),
      child: BlocConsumer<NoteFormBloc, NoteFormState>(
          listenWhen: (p, c) =>
              p.saveFailureOrSuccessOption != c.saveFailureOrSuccessOption,
          listener: (context, state) {
            state.saveFailureOrSuccessOption.fold(() {}, (either) {
              either.fold((failure) {
                FlushbarHelper.createError(
                    message: failure.map(
                        unexpected: (_) =>
                            "Unexpected error occured, please contact support.",
                        insufficientPermissions: (_) =>
                            "Insufficient permissions.",
                        unableToUpdate: (_) =>
                            "Couldn't update the note.")).show(context);
              }, (_) {
                ExtendedNavigator.of(context).popUntil(
                  (route) => route.settings.name == Routes.notesOverviewPage,
                );
              });
            });
          },
          buildWhen: (p, c) => p.isSaving != c.isSaving,
          builder: (context, state) {
            return Stack(
              children: [
                const NoteFormPageScaffold(),
                SavingInProgressOverlay(
                  isSaving: state.isSaving,
                )
              ],
            );
          }),
    );
  }
}

class SavingInProgressOverlay extends StatelessWidget {
  final bool isSaving;
  const SavingInProgressOverlay({
    Key key,
    this.isSaving,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isSaving,
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          color: isSaving ? Colors.black.withOpacity(0.8) : Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Visibility(
            visible: isSaving,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 8),
                Text('Saving',
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(color: Colors.white, fontSize: 16))
              ],
            ),
          )),
    );
  }
}

class NoteFormPageScaffold extends StatelessWidget {
  const NoteFormPageScaffold({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: BlocBuilder<NoteFormBloc, NoteFormState>(
              buildWhen: (p, c) => p.isEditing != c.isEditing,
              builder: (context, state) {
                return Text(state.isEditing ? "Edit a note" : "Create a note");
              }),
          actions: [
            IconButton(
                icon: const Icon(Icons.check),
                onPressed: () {
                  // ignore: deprecated_member_use
                  context.bloc<NoteFormBloc>().add(const NoteFormEvent.saved());
                })
          ],
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: BlocBuilder<NoteFormBloc, NoteFormState>(
          buildWhen: (p, c) => p.showErrorMessage != c.showErrorMessage,
          builder: (context, state) {
            return ChangeNotifierProvider(
              create: (_) => FormTodos(),
              child: Form(
                  autovalidate: state.showErrorMessage,
                  child: SingleChildScrollView(
                    child: Column(
                      children: const [
                        BodyField(),
                        ColorField(),
                        TodoList(),
                        AddTodoTile()
                      ],
                    ),
                  )),
            );
          },
        ));
  }
}
