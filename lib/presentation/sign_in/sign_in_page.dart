import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_clean_architecture/application/auth/sigin_in_form/sign_in_form_bloc.dart';
import 'package:note_clean_architecture/injection.dart';
import 'package:note_clean_architecture/presentation/sign_in/widgets/sign_in_form.dart';

class SigInPage extends StatelessWidget {
  const SigInPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign In'),
        ),
        body: BlocProvider(
            create: (context) => getIt<SignInFormBloc>(),
            child: const SignInForm()));
  }
}
