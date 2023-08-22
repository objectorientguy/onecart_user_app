import '../../data/models/address_model/address_model.dart';

abstract class AddressStates {}

class AddressInitial extends AddressStates {}

class FetchAddressLoading extends AddressStates {}

class FetchAddressLoaded extends AddressStates {
  final GetAllAddressModel fetchAddressModel;

final List addressDetails;
  FetchAddressLoaded({required this.fetchAddressModel, required this.addressDetails});
}

class FetchAddressError extends AddressStates {
  final String message;

  FetchAddressError({required this.message});
}
