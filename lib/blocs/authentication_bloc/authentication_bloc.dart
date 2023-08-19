import 'dart:async';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/utils/shared_pref_keys.dart';
import '../../app_module/app_module.dart';
import '../../utils/shared_pref.dart';
import 'authentication_events.dart';
import 'authentication_states.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvents, AuthenticationStates> {
  final CustomerCache _customerCache = getIt<CustomerCache>();

  // final AuthenticationRepository _authenticationRepository =
  //     getIt<AuthenticationRepository>();

  AuthenticationStates get initialState => AuthenticationInitial();

  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticateUser>(_authenticateUser);
    on<AuthenticatedUser>(_authenticatedUser);
  }

  FutureOr<void> _authenticateUser(
      AuthenticateUser event, Emitter<AuthenticationStates> emit) async {
    // AuthenticateUserModel authenticateUserModel =
    //     await _authenticationRepository.authenticateUser();
  }

  FutureOr<void> _authenticatedUser(
      AuthenticatedUser event, Emitter<AuthenticationStates> emit) async {
    try {
      _customerCache.setIsLoggedIn(true);
      var loggedin = await _customerCache.getIsLoggedIn(CacheKeys.isLoggedIn);
      log("loggedin==========>$loggedin");
      emit(UserAuthenticated());
    } catch (e) {
      log("error=========>$e");
    }

    // AuthenticateUserModel authenticateUserModel =
    //     await _authenticationRepository.authenticateUser();
  }
}
