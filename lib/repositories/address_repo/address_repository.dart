import '../../data/models/address_model/address_model.dart';
import '../../data/models/address_model/edit_address_model.dart';

abstract class AddressRepository {
  Future<GetAllAddressModel> fetchAddress();
  Future<EditAddressModel> editAddress(Map saveAddress, addressId);
}
