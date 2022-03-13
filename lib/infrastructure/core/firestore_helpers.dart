import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_clean_architecture/domain/auth/i_auth_facade.dart';
import 'package:note_clean_architecture/domain/core/errors.dart';
import 'package:note_clean_architecture/injection.dart';

extension FirestoreX on FirebaseFirestore {
  Future<DocumentReference> userDocument() async {
    final userOption = await getIt<IAuthFacade>().getSignedInUser();
    final user = userOption.getOrElse(() => throw NoteAuthenticatedError());
    return FirebaseFirestore.instance
        .collection('users')
        .doc(user.id.getOrCrash());
  }
}

extension DocumentReferenceX on DocumentReference {
  CollectionReference get noteCollection => collection('notes');
}
