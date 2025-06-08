


import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login/login/view/login_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(padding: EdgeInsets.all(8),
        child: BlocProvider(
            create: (context) => LoginCubit(context.read<AuthenticationRepository>()),
            child: const LoginForm(),
        ),
      ),
    );
  }
}
