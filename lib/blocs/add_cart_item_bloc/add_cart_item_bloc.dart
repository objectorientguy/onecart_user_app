import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/blocs/add_cart_item_bloc/add_cart_item_event.dart';
import 'package:onecart_user_app/blocs/add_cart_item_bloc/add_cart_item_states.dart';

import '../../app_module/app_module.dart';
import '../../data/models/add_cart_items/add_cart_items_model.dart';
import '../../data/models/add_cart_items/decrement_cart_item_model.dart';
import '../../data/models/add_cart_items/delete_cart_item_model.dart';
import '../../data/models/add_cart_items/increment_cart_item_model.dart';
import '../../repositories/add_cart_item/add_cart_item_repository.dart';

class AddToCartBloc extends Bloc<CartEvents, CartStates> {
  final AddToCartRepository _cartRepository = getIt<AddToCartRepository>();

  CartStates get initialState => AddItemInitial();

  AddToCartBloc() : super(AddItemInitial()) {
    on<AddItemsToCart>(_addItemsToCart);
    on<IncrementCartItemCount>(_incrementCartItemCount);
    on<DecrementCartItemCount>(_decrementCartItemCount);
    on<DeleteCartItem>(_deleteCartItem);
  }

  FutureOr<void> _addItemsToCart(
      AddItemsToCart event, Emitter<CartStates> emit) async {
    emit(AddItemLoading());

    try {
      Map cartDetails = {
        "product_id": event.prodId,
        "variant_id": event.variantId,
        "count": event.count,
      };
      AddToCartModel addToCartModel =
          await _cartRepository.addToCart(cartDetails);

      if (addToCartModel.status == 200) {
        emit(AddItemLoaded(
            addToTheCartModel: addToCartModel, cartItemDetails: cartDetails));
      } else {
        emit(AddItemsError(message: addToCartModel.message));
      }
    } catch (e) {
      emit(AddItemsError(message: e.toString()));
    }
  }

  FutureOr<void> _incrementCartItemCount(
      IncrementCartItemCount event, Emitter<CartStates> emit) async {
    emit(IncrementCartItemLoading());
    try {
      IncrementCartCountModel incrementCartCount =
          await _cartRepository.incrementCartItemCount(
              event.incrementCountDetails,
              event.cartItemId,
              event.productId,
              event.variantId);
      emit(IncrementCartItemLoaded(
          incrementCountDetails: {},
          incrementCartCountModel: incrementCartCount,
          variantId: null,
          productId: null,
          cartItemId: null));
    } catch (e) {
      emit(IncrementCartItemError(message: e.toString()));
    }
  }

  FutureOr<void> _decrementCartItemCount(
      DecrementCartItemCount event, Emitter<CartStates> emit) async {
    emit(DecrementCartItemLoading());
    try {
      DecrementCartCountModel decrementCartCount =
          await _cartRepository.decrementCartItemCount(
              event.decrementCountDetails,
              event.cartItemId,
              event.productId,
              event.variantId);
      emit(DecrementCartItemLoaded(
          decrementCountDetails: {},
          decrementCartCountModel: decrementCartCount,
          variantId: null,
          productId: null,
          cartItemId: null));
    } catch (e) {
      emit(DecrementCartItemError(message: e.toString()));
    }
  }

  FutureOr<void> _deleteCartItem(
      DeleteCartItem event, Emitter<CartStates> emit) async {
    emit(DeleteCartItemLoading());
    try {
      DeleteCartItemModel deleteCartItemModel =
          await _cartRepository.deleteCartItem(event.deleteId);
      emit(DeleteCartItemLoaded(deleteCartItemModel: deleteCartItemModel));
    } catch (e) {
      emit(DeleteCartItemError(message: e.toString()));
    }
  }
}
