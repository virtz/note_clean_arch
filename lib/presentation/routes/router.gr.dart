// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../domain/notes/note.dart';
import '../notes/note_form/note_form_page.dart';
import '../notes/notes_overview/note_overview_page.dart';
import '../sign_in/sign_in_page.dart';
import '../splash/splash_page.dart';

class Routes {
  static const String sigInPage = '/sig-in-page';
  static const String notesOverviewPage = '/notes-overview-page';
  static const String noteFormPage = '/note-form-page';
  static const String splashPage = '/';
  static const all = <String>{
    sigInPage,
    notesOverviewPage,
    noteFormPage,
    splashPage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.sigInPage, page: SigInPage),
    RouteDef(Routes.notesOverviewPage, page: NotesOverviewPage),
    RouteDef(Routes.noteFormPage, page: NoteFormPage),
    RouteDef(Routes.splashPage, page: SplashPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SigInPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SigInPage(),
        settings: data,
      );
    },
    NotesOverviewPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const NotesOverviewPage(),
        settings: data,
      );
    },
    NoteFormPage: (data) {
      final args = data.getArgs<NoteFormPageArguments>(
        orElse: () => NoteFormPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => NoteFormPage(
          key: args.key,
          editedNote: args.editedNote,
        ),
        settings: data,
        fullscreenDialog: true,
      );
    },
    SplashPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SplashPage(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension RouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushSigInPage() => push<dynamic>(Routes.sigInPage);

  Future<dynamic> pushNotesOverviewPage() =>
      push<dynamic>(Routes.notesOverviewPage);

  Future<dynamic> pushNoteFormPage({
    Key key,
    Note editedNote,
  }) =>
      push<dynamic>(
        Routes.noteFormPage,
        arguments: NoteFormPageArguments(key: key, editedNote: editedNote),
      );

  Future<dynamic> pushSplashPage() => push<dynamic>(Routes.splashPage);
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// NoteFormPage arguments holder class
class NoteFormPageArguments {
  final Key key;
  final Note editedNote;
  NoteFormPageArguments({this.key, this.editedNote});
}
