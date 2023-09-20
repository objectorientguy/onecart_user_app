import '../../data/models/address_model/add_address_model.dart';
import '../../data/models/address_model/address_model.dart';
import '../../data/models/address_model/edit_address_model.dart';

abstract class AddressRepository {
  Future<GetAllAddressModel> fetchAddress();

  Future<EditAddressModel> editAddress(Map saveAddress, int addressId);

  Future<AddAddressModel> addAddress(Map saveAddress, int userId);
}
