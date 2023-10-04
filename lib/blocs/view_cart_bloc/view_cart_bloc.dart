import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/blocs/view_cart_bloc/view_cart_events.dart';
import 'package:onecart_user_app/blocs/view_cart_bloc/view_cart_states.dart';

import '../../app_module/app_module.dart';
import '../../data/models/view_cart/view_cart_model.dart';
import '../../repositories/view_cart/view_cart_repository.dart';

class GetAllCartItemsBloc extends Bloc<GetAllCartItems, ViewCartStates> {
  final ViewCartRepository _viewCartRepository = getIt<ViewCartRepository>();

  ViewCartStates get initialState => GetAllCartItemsInitial();

  GetAllCartItemsBloc() : super(GetAllCartItemsInitial()) {
    on<GetAllCartItems>(_getAllCartItems);
  }

  FutureOr<void> _getAllCartItems(
      GetAllCartItems event, Emitter<ViewCartStates> emit) async {
    emit(GetAllCartItemsLoading());
    // try {
    ViewCartModel viewCartModel = await _viewCartRepository.getAllCartItems();

    emit(GetAllCartItemsLoaded(viewCartModel: viewCartModel));
    // } catch (e) {
    //   emit(GetAllCartItemsError(message: e.toString()));
    // }
  }
}
