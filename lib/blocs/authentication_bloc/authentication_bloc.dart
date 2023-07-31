import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/data/models/authenticate_user/authenticate%20_user_model.dart';
import '../../app_module/app_module.dart';
import '../../repositories/authentication/authentication_repository.dart';
import 'authentication events.dart';
import 'authentication_states.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvents, AuthenticationStates> {
  final AuthenticationRepository _authenticationRepository =
      getIt<AuthenticationRepository>();

  AuthenticationStates get initialState => AuthenticationInitial();

  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticateUser>(_authenticateUser);
  }

  FutureOr<void> _authenticateUser(
      AuthenticateUser event, Emitter<AuthenticationStates> emit) async {
    AuthenticateUserModel authenticateUserModel =
        await _authenticationRepository.authenticateUser();
    log(authenticateUserModel.data.customerId.toString());
  }
}
