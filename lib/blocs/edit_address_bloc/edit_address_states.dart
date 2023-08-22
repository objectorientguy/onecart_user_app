import 'package:onecart_user_app/blocs/address_bloc/address_states.dart';

abstract class EditAddressStates {}

class EditAddressInitial extends EditAddressStates{}

class FetchEditAddressLoading extends AddressStates {}

class FetchEditAddressLoaded extends AddressStates {}

class FetchEditAddressError extends AddressStates {}