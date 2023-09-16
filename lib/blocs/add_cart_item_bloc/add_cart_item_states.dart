import '../../data/models/add_cart_items/add_cart_items_model.dart';

abstract class AddItemsToCartStates {}

class AddItemInitial extends AddItemsToCartStates {}

class AddItemLoading extends AddItemsToCartStates {}

class AddItemLoaded extends AddItemsToCartStates {
  final AddToCartModel addToTheCartModel;

  final Map cartItemDetails;

  AddItemLoaded(
      {required this.addToTheCartModel, required this.cartItemDetails});
}

class AddItemsError extends AddItemsToCartStates {
  final String message;

  AddItemsError({required this.message});
}
