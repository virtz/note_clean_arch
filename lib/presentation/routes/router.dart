import 'package:auto_route/auto_route_annotations.dart';
import 'package:note_clean_architecture/presentation/notes/note_form/note_form_page.dart';
import 'package:note_clean_architecture/presentation/notes/notes_overview/note_overview_page.dart';
import 'package:note_clean_architecture/presentation/sign_in/sign_in_page.dart';
import 'package:note_clean_architecture/presentation/splash/splash_page.dart';

@MaterialAutoRouter(
    generateNavigationHelperExtension: true,
    routes: <AutoRoute>[
      MaterialRoute(page: SigInPage),
      MaterialRoute(page: NotesOverviewPage),
      MaterialRoute(page: NoteFormPage,fullscreenDialog:true),
      MaterialRoute(page: SplashPage, initial: true),
    ])
class $Router {}
