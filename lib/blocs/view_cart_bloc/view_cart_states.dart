import '../../data/models/view_cart/view_cart_model.dart';

abstract class ViewCartStates {}

class GetAllCartItemsInitial extends ViewCartStates {}

class GetAllCartItemsLoading extends ViewCartStates {}

class GetAllCartItemsLoaded extends ViewCartStates {
  final ViewCartModel viewCartModel;

  GetAllCartItemsLoaded({required this.viewCartModel});
}

class GetAllCartItemsError extends ViewCartStates {
  final String message;

  GetAllCartItemsError({required this.message});
}
