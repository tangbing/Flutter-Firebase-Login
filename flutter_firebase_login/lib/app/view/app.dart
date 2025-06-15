import 'package:authentication_repository/authentication_repository.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login/app/bloc/theme_cubit.dart';
import 'package:flutter_firebase_login/theme.dart';
import 'package:flutter_firebase_login/app/app.dart';


class App extends StatelessWidget {
  const App({required AuthenticationRepository authenticationRepository,
    super.key}) :
        _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;


  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        lazy: false,
        create: (_) =>
        AppBloc(
            authenticationRepository: _authenticationRepository)
          ..add(const AppUserSubscriptionRequested()),
        child: BlocProvider(
          create: (context) => ThemeCubit(),
          child: AppView(),
        ),
      ),
    );
  }
}

class MyAppState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    final mode = context
        .watch<ThemeCubit>()
        .state;

    return MaterialApp(
      theme: theme,
      darkTheme: darkTheme,
      themeMode: mode,
      home: FlowBuilder(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  MyAppState createState() => MyAppState();
}
