import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/app_module/app_module.dart';
import 'package:onecart_user_app/blocs/address_bloc/address_event.dart';
import 'package:onecart_user_app/blocs/address_bloc/address_states.dart';
import 'package:onecart_user_app/repositories/address_repo/address_repository.dart';

import '../../data/models/address_model/address_model.dart';

class AddressBloc extends Bloc<AddressEvents, AddressStates> {
  final AddressRepository _addressRepository = getIt<AddressRepository>();

  AddressStates get initialState => AddressInitial();

  AddressBloc() : super(AddressInitial()) {
    on<FetchAddress>(_fetchAddress);
  }

  FutureOr<void> _fetchAddress(
      FetchAddress event, Emitter<AddressStates> emit) async {
    emit(FetchAddressLoading());
    try {
      log('Hello');
      List fetchAddressData = [];
      GetAllAddressModel fetchAddressModel =
          await _addressRepository.fetchAddress();
      log(fetchAddressModel.data.toString());
      fetchAddressData = fetchAddressModel.data!;
      emit(FetchAddressLoaded(
        fetchAddressModel: fetchAddressModel,
        addressDetails: fetchAddressData,
      ));
    } catch (e) {
      emit(FetchAddressError(message: e.toString()));
    }
  }
}
