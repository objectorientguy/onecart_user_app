import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/app_module/app_module.dart';
import 'package:onecart_user_app/blocs/address_bloc/address_event.dart';
import 'package:onecart_user_app/blocs/address_bloc/address_states.dart';
import 'package:onecart_user_app/repositories/address_repo/address_repository.dart';

import '../../data/models/address_model/add_address_model.dart';
import '../../data/models/address_model/address_model.dart';
import '../../data/models/address_model/edit_address_model.dart';

class AddressBloc extends Bloc<AddressEvents, AddressStates> {
  final AddressRepository _addressRepository = getIt<AddressRepository>();
  AddressStates get initialState => AddressInitial();

  AddressBloc() : super(AddressInitial()) {
    on<FetchAddress>(_fetchAddress);
    on<EditAddress>(_editAddress);
    on<AddAddress>(_addAddress);
  }

  FutureOr<void> _fetchAddress(
      FetchAddress event, Emitter<AddressStates> emit) async {
    emit(FetchAddressLoading());
    try {
      List fetchAddressData = [];
      GetAllAddressModel fetchAddressModel =
          await _addressRepository.fetchAddress();
      fetchAddressData = fetchAddressModel.data;
      emit(FetchAddressLoaded(
        fetchAddressModel: fetchAddressModel,
        addressDetails: fetchAddressData,
      ));
    } catch (e) {
      emit(FetchAddressError(message: e.toString()));
    }
  }

  FutureOr<void> _editAddress(
      EditAddress event, Emitter<AddressStates> emit) async {
    emit(EditAddressLoading());
    try {
      EditAddressModel editAddress = await _addressRepository.editAddress(
          event.saveAddress, event.addressId);
      log('address get====================>${event.saveAddress}');
      emit(EditAddressLoaded(
        editAddressModel: editAddress,
        saveAddress: {},
        addressId: [],
      ));
    } catch (e) {
      emit(EditAddressError(message: e.toString()));
    }
  }

  FutureOr<void> _addAddress(
      AddAddress event, Emitter<AddressStates> emit) async {
    emit(AddAddressLoading());
    // try {
    log('address post===========>${event.addAddress}');
    AddAddressModel addAddress =
        await _addressRepository.addAddress(event.addAddress, 9898989898);
    emit(AddAddressLoaded(
      addAddressModel: addAddress,
      addAddress: {},
    ));
    // } catch (e) {
    //    emit(AddAddressError(message: e.toString()));
    // }
  }
}
