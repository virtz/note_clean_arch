import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:note_clean_architecture/domain/notes/i_note_repository.dart';
import 'package:note_clean_architecture/domain/notes/note.dart';
import 'package:note_clean_architecture/domain/notes/note_failure.dart';

part 'note_watcher_event.dart';
part 'note_watcher_state.dart';
part 'note_watcher_bloc.freezed.dart';

@injectable
class NoteWatcherBloc extends Bloc<NoteWatcherEvent, NoteWatcherState> {
  final INoteRespository _noteRespository;

  NoteWatcherBloc(this._noteRespository):super(const NoteWatcherState.initial());
  StreamSubscription<Either<NoteFailure, KtList<Note>>> _noteStreamSubscription;

  @override
  Stream<NoteWatcherState> mapEventToState(
    NoteWatcherEvent event,
  ) async* {
    yield* event.map(watchAllStarted: (e) async* {
      yield const NoteWatcherState.loadInProgress();
      await _noteStreamSubscription?.cancel();

      _noteStreamSubscription = _noteRespository.watchAll().listen(
          (failureOrNotes) =>
              add(NoteWatcherEvent.notesReceived(failureOrNotes)));

    }, 
    watchUncompletedStarted: (e) async* {
      yield const NoteWatcherState.loadInProgress();
      await _noteStreamSubscription?.cancel();
      _noteStreamSubscription = _noteRespository.watchUncompleted().listen(
          (failureOrNotes) =>
              add(NoteWatcherEvent.notesReceived(failureOrNotes)));
    }, notesReceived: (e) async* {
      yield e.failureOrNotes.fold((f) => NoteWatcherState.loadFailure(f),
          (notes) => NoteWatcherState.loadSuccess(notes));
    });
  }



@override
  Future<void> close()async {
   await _noteStreamSubscription?.cancel();
    return super.close();
  }

}
