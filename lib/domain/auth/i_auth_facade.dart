// import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
// import 'package:injectable/injectable.dart';

import 'package:note_clean_architecture/domain/auth/auth_failure.dart';
import 'package:note_clean_architecture/domain/auth/user.dart';
import 'package:note_clean_architecture/domain/auth/value_objects.dart';

// @injectable

abstract class IAuthFacade {
  // @preResolve
  Future<Option<User>> getSignedInUser();

  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {@required EmailAddress emailAddress, @required Password password});

  // @preResolve
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      {@required EmailAddress emailAddress, @required Password password});

  // @preResolve
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  // @preResolve
  Future<Either<AuthFailure, String>> returnsAValueString();
  Future<void> signOut();
}
