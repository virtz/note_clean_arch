import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_clean_architecture/application/auth/auth_bloc.dart';
import 'package:note_clean_architecture/presentation/routes/router.gr.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.map(
              initial: (_) {},
              authernticated: (_) {
                // ExtendedNavigator.of(context).replace(Routes.sigInPage);
                ExtendedNavigator.of(context).replace(Routes.notesOverviewPage);
              },
              unAuthernticated: (_) {
                ExtendedNavigator.of(context).replace(Routes.sigInPage);
              });
        },
        child: const Scaffold(
            body: Center(
          child: CircularProgressIndicator(),
        )));
  }
}
