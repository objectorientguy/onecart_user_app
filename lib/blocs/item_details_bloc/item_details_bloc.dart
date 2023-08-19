import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/blocs/item_details_bloc/item_details_events.dart';
import 'package:onecart_user_app/blocs/item_details_bloc/item_details_states.dart';

import '../../app_module/app_module.dart';
import '../../data/models/item_details/item_details_model.dart';
import '../../repositories/item_details/item_details_repository.dart';
import '../categories_bloc/categories_states.dart';

class ItemDetailsBloc extends Bloc<FetchItemDetails, ItemDetailsStates> {
  final ItemDetailsRepository _itemDetailsRepository =
      getIt<ItemDetailsRepository>();

  GetAllCategoriesInitial get initialState => GetAllCategoriesInitial();

  ItemDetailsBloc() : super(ItemDetailsInitial()) {
    on<FetchItemDetails>(_getItemDetails);
  }
  FutureOr<void> _getItemDetails(
      FetchItemDetails event, Emitter<ItemDetailsStates> emit) async {
    log("hello");
    emit(ItemDetailsLoading());
    try {
      ItemDetailsModel getProductDetailsModel =
          await _itemDetailsRepository.getItemDetails();
      log(getProductDetailsModel.data.toString());
      emit(ItemDetailsLoaded(itemDetailsModel: getProductDetailsModel));
    } catch (e) {
      emit(ItemDetailsError(message: e.toString()));
    }
  }
}
