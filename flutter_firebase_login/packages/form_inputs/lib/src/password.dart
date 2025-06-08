
import 'package:formz/formz.dart';

enum PasswordValidationError {
  invalid,
}

class Password extends FormzInput<String, PasswordValidationError> {

  const Password.pure() : super.pure('');

  const Password.dirty([super.value = '']) : super.dirty();

  static final RegExp _passwordRegexp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );


  @override
  PasswordValidationError? validator(String value) {
    return _passwordRegexp.hasMatch(value ?? '') ? null : PasswordValidationError.invalid;
  }


}