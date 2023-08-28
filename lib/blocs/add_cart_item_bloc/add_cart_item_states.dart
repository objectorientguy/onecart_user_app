import '../../data/models/add_cart_items/add_cart_items_model.dart';

abstract class AddItemsToCartStates{}

class AddItemInitial extends AddItemsToCartStates{}

class AddItemLoading extends AddItemsToCartStates{}

class AddItemsError extends AddItemsToCartStates {
  final String message;

  AddItemsError({required this.message});
}

class AddItemLoaded extends AddItemsToCartStates{
  final AddToCartModel addToTheCartModel;

  final List addressDetails;
  AddItemLoaded(
      {required this.addToTheCartModel, required this.addressDetails});

  // final EditAddressModel editAddressModel;
  //
  // final Map saveAddress;
  // EditAddressLoaded(
  //     {required this.saveAddress,
  //       required this.editAddressModel,
  //       required addressId});

}