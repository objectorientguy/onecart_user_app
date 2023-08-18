import '../../data/models/item_details/item_details_model.dart';

abstract class ItemDetailsStates {}

class ItemDetailsInitial extends ItemDetailsStates {}

class ItemDetailsLoading extends ItemDetailsStates {}

class ItemDetailsLoaded extends ItemDetailsStates {
  final ItemDetailsModel itemDetailsModel;

  ItemDetailsLoaded({required this.itemDetailsModel});
}

class ItemDetailsError extends ItemDetailsStates {
  final String message;

  ItemDetailsError({required this.message});
}
