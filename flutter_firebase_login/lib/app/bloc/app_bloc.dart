
import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'app_event.dart';
part 'app_state.dart';


class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required AuthenticationRepository authenticationRepository}) : _authenticationRepository = authenticationRepository,
  super(AppState(user: authenticationRepository.currentUser)) {
    on<AppUserSubscriptionRequested>(_onUserSubscriptionRequested);
    on<AppLogoutPressed>(_onLogoutPressed);
  }

  final AuthenticationRepository _authenticationRepository;

  Future<void> _onUserSubscriptionRequested(
      AppUserSubscriptionRequested event,
      Emitter<AppState> emit
      ) async {
    return emit.onEach(_authenticationRepository.user,
        onData: (user) => emit(AppState(user: user)),
        onError: (error, stackTrace) => emit(AppState()),
    );
  }

  Future<void> _onLogoutPressed(
      AppLogoutPressed event,
      Emitter<AppState> emit
      ) async {
      _authenticationRepository.logOut();
  }


}