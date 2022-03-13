import 'package:auto_route/auto_route.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_clean_architecture/application/auth/auth_bloc.dart';
import 'package:note_clean_architecture/application/notes/note_actor/note_actor_bloc.dart';
import 'package:note_clean_architecture/application/notes/note_watcher/note_watcher_bloc.dart';
import 'package:note_clean_architecture/injection.dart';
import 'package:note_clean_architecture/presentation/notes/notes_overview/widgets/notes_overview_body_widget.dart';
import 'package:note_clean_architecture/presentation/notes/notes_overview/widgets/uncompleted_switch.dart';
import 'package:note_clean_architecture/presentation/routes/router.gr.dart';

class NotesOverviewPage extends StatelessWidget {
  const NotesOverviewPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NoteWatcherBloc>(
            create: (context) => getIt<NoteWatcherBloc>()
              ..add(const NoteWatcherEvent.watchAllStarted())),
        BlocProvider<NoteActorBloc>(create: (context) => getIt<NoteActorBloc>())
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(listener: (context, state) {
            state.maybeMap(
                unAuthernticated: (_) =>
                    ExtendedNavigator.of(context).replace(Routes.sigInPage),
                orElse: () {});
          }),
          BlocListener<NoteActorBloc, NoteActorState>(
              listener: (context, state) {
            state.maybeMap(
                deleteFailure: (state) {
                  FlushbarHelper.createError(
                      duration: const Duration(seconds: 5),
                      message: state.noteFailure.map(
                          unexpected: (_) =>
                              'Unexpected error occured while deleting, please contact support.',
                          insufficientPermissions: (_) =>
                              'Inssufficient permissions ',
                          unableToUpdate: (_) =>
                              'Impossible error')).show(context);
                },
                orElse: () {});
          })
        ],
        child: Scaffold(
          appBar: AppBar(
              title: const Text('Notes'),
              leading: IconButton(
                icon: const Icon(Icons.exit_to_app),
                onPressed: () {
                  // BlocProvider
                  context.bloc<AuthBloc>().add(const AuthEvent.signedOut());
                },
              ),
              actions: const [
                UncompletedSwitch(),
              ]),
          body: const NotesOverviewBody(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // ignore: avoid_redundant_argument_values
              ExtendedNavigator.of(context).pushNoteFormPage(editedNote: null);
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
