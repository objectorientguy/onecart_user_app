import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'authentication_events.dart';
import 'authentication_states.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvents, AuthenticationStates> {
  // final AuthenticationRepository _authenticationRepository =
  //     getIt<AuthenticationRepository>();

  AuthenticationStates get initialState => AuthenticationInitial();

  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticateUser>(_authenticateUser);
  }

  FutureOr<void> _authenticateUser(
      AuthenticateUser event, Emitter<AuthenticationStates> emit) async {
    // AuthenticateUserModel authenticateUserModel =
    //     await _authenticationRepository.authenticateUser();
  }
}
