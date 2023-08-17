import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/app_module/app_module.dart';
import 'package:onecart_user_app/blocs/address_bloc/address_event.dart';
import 'package:onecart_user_app/blocs/address_bloc/address_states.dart';
import 'package:onecart_user_app/repositories/address_repo/address_repository.dart';

class AddressBloc extends Bloc<AddressEvent, AddressStates>{
  final AddressRepository _addressRepository = getIt<AddressRepository>();

AddressStates get initialState => AddressInitial();

 AddressBloc(): super(AddressInitial()){

 }

}
