import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_clean_architecture/application/auth/auth_bloc.dart';
import 'package:note_clean_architecture/injection.dart';
import 'package:note_clean_architecture/presentation/routes/router.gr.dart'
    as app_router;

// import 'package:note_clean_architecture/presentation/sign_in/sign_in_page.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()))
      ],
      child: MaterialApp(
        title: 'Notes',
        builder: ExtendedNavigator(
          router: app_router.Router(),
        ),
        theme: ThemeData.light().copyWith(
            primaryColor: Colors.green[800],
            accentColor: Colors.blueAccent,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.blue[900]
            ),
            inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)))),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
