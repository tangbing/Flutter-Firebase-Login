
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepository) : super(const LoginState());

  final AuthenticationRepository _authenticationRepository;
  
  void emailChanged(String email) => emit(state.withEmail(email));

  void passwordChanged(String password) => emit(state.withPassword(password));


  Future<void> loginWithCredentials() async {
    if (!state.isValid) return;
    emit(state.withSubmissionInProgress());

    try {
      await _authenticationRepository.loginWithEmailAndPassword(
          email: state.email.value,
          password: state.password.value
      );
      emit(state.withSubmissionSuccess());
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(state.withSubmissionFailure(e.message));
    } catch (_) {
      emit(state.withSubmissionFailure());
    }
  }

  Future<void> loginWithGoogle() async {
    emit(state.withSubmissionInProgress());
    try {
      await _authenticationRepository.loginWithGoogle();
      emit(state.withSubmissionSuccess());
    } on LogInWithGoogleFailure catch (e) {
      emit(state.withSubmissionFailure(e.message));
    } catch (_) {
      emit(state.withSubmissionFailure());
    }
  }

}