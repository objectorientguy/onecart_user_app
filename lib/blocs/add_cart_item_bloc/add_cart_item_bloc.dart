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
    on<AddItemsToCart>(_addItemsToCart);
  }

  FutureOr<void> _addItemsToCart(
      AddItemsToCart event, Emitter<AddItemsToCartStates> emit) async {
    emit(AddItemLoading());

    try {
      Map cartDetails = {
        "product_id": event.prodId,
        "variant_id": event.variantId,
        "count": event.count,
      };
      AddToCartModel addToCartModel =
          await _addToCartRepository.addToCart(cartDetails);

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
}
