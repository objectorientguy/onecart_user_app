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

class ProductAlreadyExists extends CartStates {
  final String message;

  ProductAlreadyExists({required this.message});
}

class AddItemsError extends CartStates {
  final String message;

  AddItemsError({required this.message});
}

class IncrementCounter extends CartStates {
  int count = 1;

  IncrementCounter({
    required this.count,
    required variantId,
    required productId,
  });
}

class DecrementCounter extends CartStates {
  int count = 1;

  DecrementCounter({
    required this.count,
    required variantId,
    required productId,
  });
}

class IncrementCartItemLoading extends CartStates {}

class IncrementCartItemLoaded extends CartStates {
  final IncrementCartCountModel incrementCartCountModel;

  IncrementCartItemLoaded({
    required this.incrementCartCountModel,
    required variantId,
    required productId,
  });
}

class IncrementCartItemError extends CartStates {
  final String message;

  IncrementCartItemError({required this.message});
}

class DecrementCartItemLoading extends CartStates {}

class DecrementCartItemLoaded extends CartStates {
  final DecrementCartCountModel decrementCartCountModel;

  DecrementCartItemLoaded({
    required this.decrementCartCountModel,
    required variantId,
    required productId,
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
