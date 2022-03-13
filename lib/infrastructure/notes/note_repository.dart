import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:note_clean_architecture/domain/notes/i_note_repository.dart';
import 'package:note_clean_architecture/domain/notes/note_failure.dart';
import 'package:note_clean_architecture/domain/notes/note.dart';
import "package:note_clean_architecture/infrastructure/core/firestore_helpers.dart";
import 'package:note_clean_architecture/infrastructure/notes/note_dto.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: INoteRespository)
class NoteRepository implements INoteRespository {
  final FirebaseFirestore _firestore;

  NoteRepository(this._firestore);

  @override
  Future<Either<NoteFailure, Unit>> create(Note note) async {
    try {
      final userDoc = await _firestore.userDocument();
      final noteDto = NoteDto.fromDomain(note);
      userDoc.noteCollection.doc(noteDto.id).set(noteDto.toJson());
      return right(unit);
    } on FirebaseException catch (e) {
      if (e is FirebaseException && e.message.contains('permission-denied')) {
        return left(const NoteFailure.insufficientPermissions());
      } else {
        //log .error(e.toString())
        return left(const NoteFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<NoteFailure, Unit>> delete(Note note) async {
    try {
      final userDoc = await _firestore.userDocument();
      final noteId = note.id.getOrCrash();
      userDoc.noteCollection.doc(noteId).delete();
      return right(unit);
    } on FirebaseException catch (e) {
      if (e is FirebaseException && e.message.contains('permission-denied')) {
        return left(const NoteFailure.insufficientPermissions());
      } else if (e is FirebaseException && e.message.contains('not-found')) {
        return left(const NoteFailure.unableToUpdate());
      } else {
        //log .error(e.toString())
        return left(const NoteFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<NoteFailure, Unit>> update(Note note) async {
    try {
      final userDoc = await _firestore.userDocument();
      final noteDto = NoteDto.fromDomain(note);
      userDoc.noteCollection.doc(noteDto.id).update(noteDto.toJson());
      return right(unit);
    } on FirebaseException catch (e) {
      if (e is FirebaseException && e.message.contains('permission-denied')) {
        return left(const NoteFailure.insufficientPermissions());
      } else if (e is FirebaseException && e.message.contains('not-found')) {
        return left(const NoteFailure.unableToUpdate());
      } else {
        //log .error(e.toString())
        return left(const NoteFailure.unexpected());
      }
    }
  }

  @override
  Stream<Either<NoteFailure, KtList<Note>>> watchAll() async* {
    // yield left(const NoteFailure.insufficientPermissions());
    final userDoc = await _firestore.userDocument();
    yield* userDoc.noteCollection
        .orderBy('serverTimeStamp', descending: true)
        .snapshots()
        .map((snapshot) => right<NoteFailure, KtList<Note>>(
              snapshot.docs
                  .map((doc) => NoteDto.fromFirestore(doc).toDomain())
                  .toImmutableList(),
            ))
        .onErrorReturnWith((e) {
      if (e is FirebaseException && e.message.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.insufficientPermissions());
      } else {
        //log .error(e.toString())
        return left(const NoteFailure.unexpected());
      }
    });
  }

  @override
  Stream<Either<NoteFailure, KtList<Note>>> watchUncompleted() async* {
    final userDoc = await _firestore.userDocument();
    yield* userDoc.noteCollection
        .orderBy('serverTimeStamp', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => NoteDto.fromFirestore(doc).toDomain()))
        .map((notes) => right<NoteFailure, KtList<Note>>(notes
            .where((note) =>
                note.todos.getOrCrash().any((todoItem) => !todoItem.done))
            .toImmutableList()))
        .onErrorReturnWith((e) {
      if (e is FirebaseException && e.message.contains('permission-denied')) {
        return left(const NoteFailure.insufficientPermissions());
      } else {
        //log .error(e.toString())
        return left(const NoteFailure.unexpected());
      }
    });
  }
}
