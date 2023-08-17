import '../../data/models/address_model/address_model.dart';

abstract class AddressRepository{

  Future<FetchAddressModel> fetchAddress();
}