// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_clean_architecture/application/auth/auth_bloc.dart';
import 'package:note_clean_architecture/application/auth/sigin_in_form/sign_in_form_bloc.dart';
import 'package:note_clean_architecture/presentation/routes/router.gr.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
        builder: (context, state) {
      return Form(
          autovalidate: state.showErrorMessages,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
                // ignore: prefer_const_literals_to_create_immutables

                children: [
                  const Text('📝',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 130)),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                      // focusBorder:OutlineInputBorder()
                    ),
                    autocorrect: false,
                    onChanged: (value) => context
                        .bloc<SignInFormBloc>()
                        .add(SignInFormEvent.emailChanged(value)),
                    validator: (_) => context
                        .bloc<SignInFormBloc>()
                        .state
                        .emailAddress
                        .value
                        .fold(
                            (l) => l.maybeMap(
                                invalideEmail: (_) => 'Invalid Email',
                                orElse: () => null),
                            (r) => null),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Password',
                    ),
                    autocorrect: false,
                    obscureText: true,
                    onChanged: (value) => context
                        .bloc<SignInFormBloc>()
                        .add(SignInFormEvent.passwordChanged(value)),
                    validator: (_) => context
                        .bloc<SignInFormBloc>()
                        .state
                        .password
                        .value
                        .fold(
                            (l) => l.maybeMap(
                                shortPassword: (_) => 'Short Password',
                                orElse: () => null),
                            (r) => null),
                  ),
                  Row(children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          context.bloc<SignInFormBloc>().add(
                              const SignInFormEvent
                                  .signInWithEmailAndPasswordPressed());
                        },
                        child: const Text('SIGN IN'),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          context.bloc<SignInFormBloc>().add(
                              const SignInFormEvent
                                  .registerWithEmailAndPasswordPresseD());
                        },
                        child: const Text('REGISTER'),
                      ),
                    )
                  ]),
                  const SizedBox(
                    height: 8,
                  ),
                  MaterialButton(
                      onPressed: () {
                        context.bloc<SignInFormBloc>().add(
                            const SignInFormEvent.signInWithGooglePressed());
                      },
                      color: Colors.lightBlue,
                      child: const Text(
                        'SIGN IN WITH GOOGLE',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                  if (state.isSubmitting) ...[
                    const SizedBox(height: 8),
                    const LinearProgressIndicator()
                  ]
                ]),
          ));
    }, listener: (context, state) {
      state.authFailureOrSuccessOption.fold(
          () => null,
          (either) => either.fold((failure) {
                FlushbarHelper.createError(
                        message: failure.map(
                            cancelledByUser: (_) => 'Cancelled',
                            serverError: (_) => 'Server Error',
                            emailAlreadyInUse: (_) => 'Email already in use',
                            invalidEmailAndPasswordCombination: (_) =>
                                'Invalid email and password combination'))
                    .show(context);
              }, (r) {
                ExtendedNavigator.of(context).replace(Routes.notesOverviewPage);
                context
                    .bloc<AuthBloc>()
                    .add(const AuthEvent.authCheckRequested());
              }));
    });
  }
}
