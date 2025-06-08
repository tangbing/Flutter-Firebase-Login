import 'package:formz/formz.dart';

enum EmailValidationError {
  invalid,
}

class Email extends FormzInput<String, EmailValidationError> {

  const Email.pure() : super.pure('');

  const Email.dirty([super.value = '']) : super.dirty();

  static final RegExp _emailRegexp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );


  @override
  EmailValidationError? validator(String value) {
    return _emailRegexp.hasMatch(value ?? '') ? null : EmailValidationError.invalid;
  }


}