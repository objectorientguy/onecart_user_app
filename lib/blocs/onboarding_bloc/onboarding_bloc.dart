import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_module/app_module.dart';
import '../../utils/shared_pref.dart';
import '../../utils/shared_pref_keys.dart';
import 'onboarding_events.dart';
import 'onboarding_states.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvents, OnBoardingStates> {
  final CustomerCache _customerCache = getIt<CustomerCache>();

  OnBoardingStates get initialState => OnBoardingInitial();

  OnBoardingBloc() : super(OnBoardingInitial()) {
    on<CheckLoggedIn>(_isLoggedIn);
  }

  Future<FutureOr<void>> _isLoggedIn(
      CheckLoggedIn event, Emitter<OnBoardingStates> emit) async {
    try {
      var isLoggedIn = await _customerCache.getIsLoggedIn(CacheKeys.isLoggedIn);

      if (isLoggedIn == true) {
        emit(LoggedIn());
      } else {
        emit(OnBoardingInitial());
      }
    } catch (e) {
      emit(OnBoardingInitial());
    }
  }
}
