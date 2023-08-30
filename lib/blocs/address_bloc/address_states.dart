import 'package:onecart_user_app/data/models/address_model/edit_address_model.dart';

import '../../data/models/address_model/add_address_model.dart';
import '../../data/models/address_model/address_model.dart';

abstract class AddressStates {}

class AddressInitial extends AddressStates {}

class FetchAddressLoading extends AddressStates {}

class FetchAddressLoaded extends AddressStates {
  final GetAllAddressModel fetchAddressModel;

  final List addressDetails;
  FetchAddressLoaded(
      {required this.fetchAddressModel, required this.addressDetails});
}

class FetchAddressError extends AddressStates {
  final String message;

  FetchAddressError({required this.message});
}

class EditAddressLoading extends AddressStates {}

class EditAddressLoaded extends AddressStates {
  final EditAddressModel editAddressModel;

  final Map saveAddress;
  EditAddressLoaded(
      {required this.saveAddress,
      required this.editAddressModel,
      required addressId});
}

class EditAddressError extends AddressStates {
  final String message;

  EditAddressError({required this.message});
}

class AddAddressLoading extends AddressStates {}

class AddAddressLoaded extends AddressStates {
  final AddAddressModel addAddressModel;

  final Map addAddress;
  AddAddressLoaded({
    required this.addAddress,
    required this.addAddressModel,
  });
}

class AddAddressError extends AddressStates {
  final String message;

  AddAddressError({required this.message});
}
