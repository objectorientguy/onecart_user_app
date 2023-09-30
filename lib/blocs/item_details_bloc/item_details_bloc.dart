import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/blocs/item_details_bloc/item_details_events.dart';
import 'package:onecart_user_app/blocs/item_details_bloc/item_details_states.dart';
import 'package:onecart_user_app/utils/varient_index_util.dart';

import '../../app_module/app_module.dart';
import '../../data/models/item_details/item_details_model.dart';
import '../../repositories/item_details/item_details_repository.dart';
import '../categories_bloc/categories_states.dart';

class ItemDetailsBloc extends Bloc<ItemDetails, ItemDetailsStates> {
  int variantIndex = 0;
  final ProductDetailsRepository _productDetailsRepository =
      getIt<ProductDetailsRepository>();

  GetAllCategoriesInitial get initialState => GetAllCategoriesInitial();

  ItemDetailsBloc() : super(ItemDetailsInitial()) {
    on<FetchItemDetails>(_getItemDetails);
    on<ChangeVariantIndex>(_changeVariantIndex);
  }

  FutureOr<void> _getItemDetails(
      FetchItemDetails event, Emitter<ItemDetailsStates> emit) async {
    emit(ItemDetailsLoading());
    //try {
    ProductDetailsModel getProductDetailsModel = await _productDetailsRepository
        .getProductDetails(event.itemId, event.variantId);
    log(getProductDetailsModel.data.toString());
    variantIndex = VariantIndexUtil()
        .getVariantIndex(getProductDetailsModel.data.productData);
    emit(ItemDetailsLoaded(
        productDetailsModel: getProductDetailsModel,
        variantIndex: variantIndex));
    // } catch (e) {
    //   emit(ItemDetailsError(message: e.toString()));
    // }
  }

  FutureOr<void> _changeVariantIndex(
      ChangeVariantIndex event, Emitter<ItemDetailsStates> emit) async {
    emit(ItemDetailsLoading());
    try {
      emit(ItemDetailsLoaded(
          productDetailsModel: event.productDetailsModel,
          variantIndex: event.variantIndex));
    } catch (e) {
      emit(ItemDetailsError(message: e.toString()));
    }
  }
}
