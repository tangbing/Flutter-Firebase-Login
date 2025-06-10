
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login/sign_up/bloc/sign_up_cubit.dart';
import 'package:flutter_firebase_login/sign_up/view/sign_up_form.dart';


class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: BlocProvider(
          create: (_) => SignUpCubit(context.read<AuthenticationRepository>()),
          child: SignUpForm()
      ),
    );
  }
}
