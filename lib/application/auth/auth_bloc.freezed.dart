// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AuthEventTearOff {
  const _$AuthEventTearOff();

// ignore: unused_element
  AuthCheckRequested authCheckRequested() {
    return const AuthCheckRequested();
  }

// ignore: unused_element
  SignedOut signedOut() {
    return const SignedOut();
  }
}

/// @nodoc
// ignore: unused_element
const $AuthEvent = _$AuthEventTearOff();

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult authCheckRequested(),
    @required TResult signedOut(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult authCheckRequested(),
    TResult signedOut(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult authCheckRequested(AuthCheckRequested value),
    @required TResult signedOut(SignedOut value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult authCheckRequested(AuthCheckRequested value),
    TResult signedOut(SignedOut value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res> implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  final AuthEvent _value;
  // ignore: unused_field
  final $Res Function(AuthEvent) _then;
}

/// @nodoc
abstract class $AuthCheckRequestedCopyWith<$Res> {
  factory $AuthCheckRequestedCopyWith(
          AuthCheckRequested value, $Res Function(AuthCheckRequested) then) =
      _$AuthCheckRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthCheckRequestedCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements $AuthCheckRequestedCopyWith<$Res> {
  _$AuthCheckRequestedCopyWithImpl(
      AuthCheckRequested _value, $Res Function(AuthCheckRequested) _then)
      : super(_value, (v) => _then(v as AuthCheckRequested));

  @override
  AuthCheckRequested get _value => super._value as AuthCheckRequested;
}

/// @nodoc
class _$AuthCheckRequested implements AuthCheckRequested {
  const _$AuthCheckRequested();

  @override
  String toString() {
    return 'AuthEvent.authCheckRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthCheckRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult authCheckRequested(),
    @required TResult signedOut(),
  }) {
    assert(authCheckRequested != null);
    assert(signedOut != null);
    return authCheckRequested();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult authCheckRequested(),
    TResult signedOut(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (authCheckRequested != null) {
      return authCheckRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult authCheckRequested(AuthCheckRequested value),
    @required TResult signedOut(SignedOut value),
  }) {
    assert(authCheckRequested != null);
    assert(signedOut != null);
    return authCheckRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult authCheckRequested(AuthCheckRequested value),
    TResult signedOut(SignedOut value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (authCheckRequested != null) {
      return authCheckRequested(this);
    }
    return orElse();
  }
}

abstract class AuthCheckRequested implements AuthEvent {
  const factory AuthCheckRequested() = _$AuthCheckRequested;
}

/// @nodoc
abstract class $SignedOutCopyWith<$Res> {
  factory $SignedOutCopyWith(SignedOut value, $Res Function(SignedOut) then) =
      _$SignedOutCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignedOutCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $SignedOutCopyWith<$Res> {
  _$SignedOutCopyWithImpl(SignedOut _value, $Res Function(SignedOut) _then)
      : super(_value, (v) => _then(v as SignedOut));

  @override
  SignedOut get _value => super._value as SignedOut;
}

/// @nodoc
class _$SignedOut implements SignedOut {
  const _$SignedOut();

  @override
  String toString() {
    return 'AuthEvent.signedOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SignedOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult authCheckRequested(),
    @required TResult signedOut(),
  }) {
    assert(authCheckRequested != null);
    assert(signedOut != null);
    return signedOut();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult authCheckRequested(),
    TResult signedOut(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (signedOut != null) {
      return signedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult authCheckRequested(AuthCheckRequested value),
    @required TResult signedOut(SignedOut value),
  }) {
    assert(authCheckRequested != null);
    assert(signedOut != null);
    return signedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult authCheckRequested(AuthCheckRequested value),
    TResult signedOut(SignedOut value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (signedOut != null) {
      return signedOut(this);
    }
    return orElse();
  }
}

abstract class SignedOut implements AuthEvent {
  const factory SignedOut() = _$SignedOut;
}

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

// ignore: unused_element
  Initial initial() {
    return const Initial();
  }

// ignore: unused_element
  Authernticated authernticated() {
    return const Authernticated();
  }

// ignore: unused_element
  UnAuthernticated unAuthernticated() {
    return const UnAuthernticated();
  }
}

/// @nodoc
// ignore: unused_element
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult authernticated(),
    @required TResult unAuthernticated(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult authernticated(),
    TResult unAuthernticated(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(Initial value),
    @required TResult authernticated(Authernticated value),
    @required TResult unAuthernticated(UnAuthernticated value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(Initial value),
    TResult authernticated(Authernticated value),
    TResult unAuthernticated(UnAuthernticated value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

/// @nodoc
abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

/// @nodoc
class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult authernticated(),
    @required TResult unAuthernticated(),
  }) {
    assert(initial != null);
    assert(authernticated != null);
    assert(unAuthernticated != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult authernticated(),
    TResult unAuthernticated(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(Initial value),
    @required TResult authernticated(Authernticated value),
    @required TResult unAuthernticated(UnAuthernticated value),
  }) {
    assert(initial != null);
    assert(authernticated != null);
    assert(unAuthernticated != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(Initial value),
    TResult authernticated(Authernticated value),
    TResult unAuthernticated(UnAuthernticated value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements AuthState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class $AuthernticatedCopyWith<$Res> {
  factory $AuthernticatedCopyWith(
          Authernticated value, $Res Function(Authernticated) then) =
      _$AuthernticatedCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthernticatedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthernticatedCopyWith<$Res> {
  _$AuthernticatedCopyWithImpl(
      Authernticated _value, $Res Function(Authernticated) _then)
      : super(_value, (v) => _then(v as Authernticated));

  @override
  Authernticated get _value => super._value as Authernticated;
}

/// @nodoc
class _$Authernticated implements Authernticated {
  const _$Authernticated();

  @override
  String toString() {
    return 'AuthState.authernticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Authernticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult authernticated(),
    @required TResult unAuthernticated(),
  }) {
    assert(initial != null);
    assert(authernticated != null);
    assert(unAuthernticated != null);
    return authernticated();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult authernticated(),
    TResult unAuthernticated(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (authernticated != null) {
      return authernticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(Initial value),
    @required TResult authernticated(Authernticated value),
    @required TResult unAuthernticated(UnAuthernticated value),
  }) {
    assert(initial != null);
    assert(authernticated != null);
    assert(unAuthernticated != null);
    return authernticated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(Initial value),
    TResult authernticated(Authernticated value),
    TResult unAuthernticated(UnAuthernticated value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (authernticated != null) {
      return authernticated(this);
    }
    return orElse();
  }
}

abstract class Authernticated implements AuthState {
  const factory Authernticated() = _$Authernticated;
}

/// @nodoc
abstract class $UnAuthernticatedCopyWith<$Res> {
  factory $UnAuthernticatedCopyWith(
          UnAuthernticated value, $Res Function(UnAuthernticated) then) =
      _$UnAuthernticatedCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnAuthernticatedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $UnAuthernticatedCopyWith<$Res> {
  _$UnAuthernticatedCopyWithImpl(
      UnAuthernticated _value, $Res Function(UnAuthernticated) _then)
      : super(_value, (v) => _then(v as UnAuthernticated));

  @override
  UnAuthernticated get _value => super._value as UnAuthernticated;
}

/// @nodoc
class _$UnAuthernticated implements UnAuthernticated {
  const _$UnAuthernticated();

  @override
  String toString() {
    return 'AuthState.unAuthernticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UnAuthernticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult authernticated(),
    @required TResult unAuthernticated(),
  }) {
    assert(initial != null);
    assert(authernticated != null);
    assert(unAuthernticated != null);
    return unAuthernticated();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult authernticated(),
    TResult unAuthernticated(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (unAuthernticated != null) {
      return unAuthernticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(Initial value),
    @required TResult authernticated(Authernticated value),
    @required TResult unAuthernticated(UnAuthernticated value),
  }) {
    assert(initial != null);
    assert(authernticated != null);
    assert(unAuthernticated != null);
    return unAuthernticated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(Initial value),
    TResult authernticated(Authernticated value),
    TResult unAuthernticated(UnAuthernticated value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (unAuthernticated != null) {
      return unAuthernticated(this);
    }
    return orElse();
  }
}

abstract class UnAuthernticated implements AuthState {
  const factory UnAuthernticated() = _$UnAuthernticated;
}
