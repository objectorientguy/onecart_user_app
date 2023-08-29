import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/blocs/add_cart_item_bloc/add_cart_item_event.dart';
import 'package:onecart_user_app/blocs/add_cart_item_bloc/add_cart_item_states.dart';

class AddToCartBloc extends Bloc<AddToCartEvents, AddItemsToCartStates> {
  AddItemsToCartStates get initialState => AddItemInitial();

  AddToCartBloc() : super(AddItemInitial()) {
    on<FetchItems>(_addItemsToCart);
  }
  FutureOr<void> _addItemsToCart(
      FetchItems event, Emitter<AddItemsToCartStates> emit) async {
    try {} catch (e) {
      emit(AddItemsError(message: e.toString()));
    }
  }
}
