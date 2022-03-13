import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:note_clean_architecture/domain/auth/user.dart';
import 'package:note_clean_architecture/domain/core/value_objects.dart';

extension FirebaseUserDomainX on firebase.User {
  User toDomain() {
    return User(
      id: UniqueId.fromUniqueString(uid),
    );
  }
}