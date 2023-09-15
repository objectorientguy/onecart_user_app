import 'dart:developer';

import '../../data/models/address_model/add_address_model.dart';
import '../../data/models/address_model/address_model.dart';
import '../../data/models/address_model/edit_address_model.dart';
import '../../utils/dio_client.dart';
import 'address_repository.dart';

class AddressRepositoryImpl implements AddressRepository {
  @override
  Future<GetAllAddressModel> fetchAddress() async {
    final response = await DioClient()
        .get("https://oneart.onrender.com/getAllAddresses?userId=9898989898");
    return GetAllAddressModel.fromJson(response);
  }

  @override
  Future<EditAddressModel> editAddress(Map saveAddress, addressId) async {
    final response = await DioClient().put(
        "https://oneart.onrender.com/editAddress?addressId=$addressId",
        saveAddress);
    log('response=========>$response');
    return EditAddressModel.fromJson(response);
  }

  @override
  Future<AddAddressModel> addAddress(Map addAddress, userId) async {
    final response = {
      "status": "200",
      "message": "New address created!",
      "data": {
        "user_contact": 9898989898,
        "address_id": 42,
        "address_name": "Testing Edit Address",
        "city": "Pune",
        "pincode": 123456,
        "address_type": "Home",
        "phone_no": 8989898989,
        "state": "maharshtra",
        "name": "akash"
      }
    };
    // await DioClient().post(
    //     "https://oneart.onrender.com/addAddress?user_contact=9898989898",
    //     addAddress);
     return AddAddressModel.fromJson(response);
  }
}
