import '../../data/models/item_details/item_details_model.dart';

abstract class ItemDetailsStates {}

class ItemDetailsInitial extends ItemDetailsStates {}

class ItemDetailsLoading extends ItemDetailsStates {}

class ItemDetailsLoaded extends ItemDetailsStates {
  final ProductDetailsModel productDetailsModel;
  final int variantIndex;

  ItemDetailsLoaded(
      {required this.variantIndex, required this.productDetailsModel});
}

class ItemDetailsError extends ItemDetailsStates {
  final String message;

  ItemDetailsError({required this.message});
}

class VariantDetailsLoaded extends ItemDetailsStates {
  final ProductDetailsModel itemDetailsModel;

  VariantDetailsLoaded({required this.itemDetailsModel});
}
