import 'dart:developer';

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
  Future<EditAddressModel> editAddress(Map saveAddress) async{
    final response = await DioClient()
        .put("https://oneart.onrender.com/editAddress?addressId=3",saveAddress);
    log('response=========>$response');
    return EditAddressModel.fromJson(response);
  }
}
