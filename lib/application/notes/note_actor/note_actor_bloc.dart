import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:note_clean_architecture/domain/notes/i_note_repository.dart';
import 'package:note_clean_architecture/domain/notes/note.dart';
import 'package:note_clean_architecture/domain/notes/note_failure.dart';

part 'note_actor_event.dart';
part 'note_actor_state.dart';
part 'note_actor_bloc.freezed.dart';


@injectable
class NoteActorBloc extends Bloc<NoteActorEvent, NoteActorState> {
  final INoteRespository _noteRepository;

  NoteActorBloc(this._noteRepository):super( const NoteActorState.initial());

  @override
  Stream<NoteActorState> mapEventToState(
    NoteActorEvent event,
  ) async* {
    yield const NoteActorState.actionInProgress();
    final possibleFailure = await _noteRepository.delete(event.note);
    yield possibleFailure.fold((f) => NoteActorState.deleteFailure(f),
        (_) => const  NoteActorState.deleteSuccess());
  }


}
