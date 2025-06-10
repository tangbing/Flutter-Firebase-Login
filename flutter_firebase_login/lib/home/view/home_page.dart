import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login/app/bloc/app_bloc.dart';
import 'package:flutter_firebase_login/home/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage(child: HomePage());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              context.read<AppBloc>().add(const AppLogoutPressed());
            },
          )
        ],
      ),
      body: Center(
        child: Column(
           mainAxisSize: MainAxisSize.min,
          children: [
            Avatar(photo: user.photo),
            const SizedBox(height: 4),
            Text(user.email ?? '', style: textTheme.titleLarge),
            const SizedBox(height: 4),
            Text(user.name ?? '', style: textTheme.headlineSmall),
          ],
        ),
      ),
    );
  }
}
