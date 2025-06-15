import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login/app/bloc/theme_cubit.dart';
import 'package:flutter_firebase_login/app/view/app.dart';
import 'package:flutter_firebase_login/login/bloc/login_cubit.dart';
import 'package:formz/formz.dart';

import 'login_form.dart';



class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page<void> page() => const MaterialPage(child: LoginPage());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        actions: [
          PopupMenuButton<ThemeMode>(
            icon: const Icon(Icons.brightness_6),
            onSelected: (ThemeMode mode) {
              // Update the theme mode in the app
              final appState = context.read<ThemeCubit>();

              switch (mode) {
                case ThemeMode.light:
                appState.setLightTheme();
                break;
                case ThemeMode.dark:
                  appState.setDarkTheme();
                  break;
                case ThemeMode.system:
                  appState.setSystemTheme();
                  break;
              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: ThemeMode.light,
                child: Text('Light'),
              ),
              PopupMenuItem(
                value: ThemeMode.dark,
                child: Text('Dark'),
              ),
              PopupMenuItem(
                value: ThemeMode.system,
                child: Text('System'),
              ),
            ],
          ),
        ],
      ),
      body: Padding(padding: EdgeInsets.all(8),
        child: BlocProvider(
            create: (context) => LoginCubit(context.read<AuthenticationRepository>()),
            child: BlocListener<LoginCubit, LoginState>(
                listener: (BuildContext context, state) {
                  if (state.status.isSuccess) {
                    print('listener!-----');
                  }
                },
                child: const LoginForm()),
        ),
      ),
    );
  }
}
