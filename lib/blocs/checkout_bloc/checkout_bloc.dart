import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/blocs/checkout_bloc/checkout_event.dart';
import 'package:onecart_user_app/blocs/checkout_bloc/checkout_states.dart';

import '../../app_module/app_module.dart';
import '../../data/models/checkout_model/checkout_model.dart';
import '../../repositories/checkout_repo/checkout_repository.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutStates> {
  final CheckoutRepository _checkoutRepository = getIt<CheckoutRepository>();

  CheckoutStates get initialState => CheckoutInitial();

  CheckoutBloc() : super(CheckoutInitial()) {
    on<FetchCheckoutDetails>(_fetchCheckoutDetails);
  }
  FutureOr<void> _fetchCheckoutDetails(
      FetchCheckoutDetails event, Emitter<CheckoutStates> emit) async {
    emit(FetchCheckoutLoading());
    try {
      log('123');
      List fetchCheckoutData = [];
      FetchCheckoutModel fetchCheckoutModel =
          await _checkoutRepository.fetchCheckout();
      fetchCheckoutData = fetchCheckoutModel.data! as List;
      emit(FetchCheckoutLoaded(
          fetchCheckoutModel: fetchCheckoutModel,
          CheckoutDetails: fetchCheckoutData));
    } catch (e) {
      emit(FetchCheckoutError(message: e.toString()));
    }
  }
}
