import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/blocs/add_cart_item_bloc/add_cart_item_event.dart';
import 'package:onecart_user_app/blocs/add_cart_item_bloc/add_cart_item_states.dart';

import '../../app_module/app_module.dart';
import '../../data/models/add_cart_items/add_cart_items_model.dart';
import '../../repositories/add_cart_item/add_cart_item_repository.dart';

class AddToCartBloc extends Bloc<AddToCartEvents, AddItemsToCartStates> {
  final AddToCartRepository _addToCartRepository = getIt<AddToCartRepository>();
  AddItemsToCartStates get initialState => AddItemInitial();

  AddToCartBloc() : super(AddItemInitial()) {
    on<FetchCartItems>(_addItemsToCart);
  }

  FutureOr<void> _addItemsToCart(
      FetchCartItems event, Emitter<AddItemsToCartStates> emit) async {
    emit(AddItemLoading());

    try {
      AddToCartModel addToCartModel =
          await _addToCartRepository.addItemsToCart();
      Map cartDetails = {
        "status": 200,
        "message": "Items Successfully Added to the Cart",
        "data": {
          "cartItem_id": 15,
          "count": 5,
          "cart_id": 1,
          "product_id": 3,
          "variant_id": 1
        }
      };
      emit(AddItemLoaded(
          addToTheCartModel: addToCartModel, cartItemDetails: cartDetails));
    } catch (e) {
      emit(AddItemsError(message: e.toString()));
    }
  }
}
