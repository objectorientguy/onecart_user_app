import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/blocs/get_product_bloc/get_product_events.dart';
import 'package:onecart_user_app/blocs/get_product_bloc/get_product_states.dart';

// class GetproductBloc extends Bloc<GetProduct, GetProductStates> {
//   final ProductsRepository _addressRepository = getIt<AddressRepository>();
//
//   GetProductStates get initialState => ProductInitial();
//
//   AddressBloc() : super(AddressInitial()) {
//     on<AddAddress>(_addAddress);
//     on<FetchAddresses>(_fetchAddress);
//     on<DeleteAddress>(_deleteAddress);
//     on<FetchCurrentLocation>(_currentLocation);
//     on<SelectedAddress>(_fetchSelectedAddress);
//     on<LocationInitialEvent>(_locationInitial);
//     on<AddressValidations>(_validateAddress);
//   }
// }