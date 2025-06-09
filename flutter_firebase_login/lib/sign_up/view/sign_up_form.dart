
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../bloc/sign_up_cubit.dart';


class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _EmailInput(),
        const SizedBox(height: 8),
        _PasswordInput(),
        const SizedBox(height: 8),
        _ConfirmPasswordInput(),
        const SizedBox(height: 8),
        _SignUpButton(),
      ],
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({super.key});
  

  @override
  Widget build(BuildContext context) {

    final displayError = context.select((SignUpCubit cubit) => cubit.state.email.displayError);
    
    return TextField(
      key: const Key('signUpForm_emailInput_textField'),
      onChanged: (email) => context.read<SignUpCubit>().emailChanged(email),
      decoration: InputDecoration(
        labelText: 'email',
        helperText: '',
        errorText: displayError != null ? 'invalid email' : null,
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    final displayError = context.select((SignUpCubit cubit) => cubit.state.password.displayError);

    return TextField(
      key: const Key('signUpForm_passwordInput_textField'),
      onChanged: (password) => context.read<SignUpCubit>().passwordChanged(password),
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'password',
        helperText: '',
        errorText: displayError != null ? 'invalid password' : null,
      ),
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  const _ConfirmPasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    final displayError = context.select((SignUpCubit cubit) => cubit.state.confirmedPassword.displayError);

    return TextField(
      key: const Key('signUpForm_confirmedPasswordInput_textField'),
      onChanged: (confirmedPassword) => context.read<SignUpCubit>().confirmedPasswordChanged(confirmedPassword),
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'confirm password',
        helperText: '',
        errorText: displayError != null ? 'passwords do not match' : null,
      ),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {

    final isInProgress = context.select((SignUpCubit cubit) => cubit.state.status.isInProgress);

    if (isInProgress) return const CircularProgressIndicator();

    final isValid = context.select((SignUpCubit cubit) => cubit.state.isValid);

    return ElevatedButton(
      key: const Key('signUpForm_continue_raisedButton'),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          backgroundColor: Colors.orangeAccent,
        ),
        onPressed: isValid ? () => context.read<SignUpCubit>().signUpFormSubmitted : null,
        child: const Text('SIGN UP')
    );

  }
}

