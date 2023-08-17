import 'package:equatable/equatable.dart';

import '../../data/models/address_model/address_model.dart';

abstract class AddressStates extends Equatable{}

class AddressInitial extends AddressStates{
  @override
  List<Object?> get props => throw UnimplementedError();

}

class FetchAddressLoading extends AddressStates{
  @override

  List<Object?> get props => [];

}

class FetchAddressLoaded extends AddressStates{
final FetchAddressModel fetchAddressModel;

FetchAddressLoaded({required this.fetchAddressModel});

  @override
  List<Object?> get props => [];
}

class FetchAddressError extends AddressStates{
  final String message;

  FetchAddressError({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
