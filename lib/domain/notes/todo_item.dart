import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note_clean_architecture/domain/core/failures.dart';
import 'package:note_clean_architecture/domain/core/value_objects.dart';
import 'package:note_clean_architecture/domain/notes/value_objects.dart';

part 'todo_item.freezed.dart';

@freezed
abstract class TodoItem implements _$TodoItem {
  const TodoItem._();

  // ignore: sort_unnamed_constructors_first
  const factory TodoItem({
    @required UniqueId id,
    @required TodoName name,
    @required bool done,
  }) = _TodoItem;

  factory TodoItem.empty() => TodoItem(
        id: UniqueId(),
        name: TodoName(''),
        done: false,
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return name.value.fold((f) => some(f), (_) => none());
  }
}
