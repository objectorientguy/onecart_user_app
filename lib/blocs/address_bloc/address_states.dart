

import '../../data/models/address_model/address_model.dart';

abstract class AddressStates {}

class AddressInitial extends AddressStates{
}


class FetchAddressLoading extends AddressStates{


}

class FetchAddressLoaded extends AddressStates{
final GetAllAddressModel fetchAddressModel;

FetchAddressLoaded({required this.fetchAddressModel});

}

class FetchAddressError extends AddressStates{
  final String message;

  FetchAddressError({required this.message});

}
