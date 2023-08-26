import '../../data/models/checkout_model/checkout_model.dart';

abstract class CheckoutStates {}

class CheckoutInitial extends CheckoutStates {}

class FetchCheckoutLoading extends CheckoutStates {}

class FetchCheckoutLoaded extends CheckoutStates {
  final FetchCheckoutModel fetchCheckoutModel;

  final List CheckoutDetails;
  FetchCheckoutLoaded({
    required this.fetchCheckoutModel,
    required this.CheckoutDetails,
  });
}

class FetchCheckoutError extends CheckoutStates {
  final String message;

  FetchCheckoutError({required this.message});
}
