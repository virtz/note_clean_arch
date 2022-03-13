part of 'note_form_bloc.dart';

@freezed
 abstract class NoteFormEvent with _$NoteFormEvent {

    const factory NoteFormEvent.initialized(Option<Note> initialNoteOption) = _Initialized;
  const factory NoteFormEvent.bodyChanged(String bodyStr) = _BodyChanged;
  const factory NoteFormEvent.colorChanged(Color color) = _ColorChnaged;
 const factory NoteFormEvent.todosChnaged(KtList<TodoItemPrimitive> todos) = _TodosChanged;

 const factory NoteFormEvent.saved() = _Saved;
}