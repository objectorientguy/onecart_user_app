import '../../data/models/add_cart_items/add_cart_items_model.dart';
import '../../data/models/add_cart_items/decrement_cart_item_model.dart';
import '../../data/models/add_cart_items/delete_cart_item_model.dart';
import '../../data/models/add_cart_items/increment_cart_item_model.dart';

abstract class CartStates {}

class AddItemInitial extends CartStates {}

class AddItemLoading extends CartStates {}

class AddItemLoaded extends CartStates {
  final AddToCartModel addToTheCartModel;

  final Map cartItemDetails;

  AddItemLoaded(
      {required this.addToTheCartModel, required this.cartItemDetails});
}

class AddItemsError extends CartStates {
  final String message;

  AddItemsError({required this.message});
}

class IncrementCartItemLoading extends CartStates {}

class IncrementCartItemLoaded extends CartStates {
  final IncrementCartCountModel incrementCartCountModel;

  final Map incrementCountDetails;

  IncrementCartItemLoaded({
    required this.incrementCountDetails,
    required this.incrementCartCountModel,
    required variantId,
    required productId,
    required cartItemId,
  });
}

class IncrementCartItemError extends CartStates {
  final String message;

  IncrementCartItemError({required this.message});
}

class DecrementCartItemLoading extends CartStates {}

class DecrementCartItemLoaded extends CartStates {
  final DecrementCartCountModel decrementCartCountModel;

  final Map decrementCountDetails;

  DecrementCartItemLoaded({
    required this.decrementCountDetails,
    required this.decrementCartCountModel,
    required variantId,
    required productId,
    required cartItemId,
  });
}

class DecrementCartItemError extends CartStates {
  final String message;

  DecrementCartItemError({required this.message});
}

class DeleteCartItemLoading extends CartStates {}

class DeleteCartItemLoaded extends CartStates {
  final DeleteCartItemModel deleteCartItemModel;

  DeleteCartItemLoaded({required this.deleteCartItemModel});
}

class DeleteCartItemError extends CartStates {
  final String message;

  DeleteCartItemError({required this.message});
}
