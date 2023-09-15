
import '../../data/models/address_model/add_address_model.dart';
import '../../data/models/address_model/address_model.dart';
import '../../data/models/address_model/edit_address_model.dart';
import 'address_repository.dart';

class AddressRepositoryImpl implements AddressRepository {
  @override
  Future<GetAllAddressModel> fetchAddress() async {
    final response = {
      "status": "200",
      "message": "success",
      "data": [
        {
          "user_contact": 9898989898,
          "address_name": "t8f8",
          "address_type": "gggggg",
          "city": "rifufit",
          "pincode": 535356,
          "address_id": 39,
          "phone_no": 5353535353,
          "state": "dyxhxhc",
          "name": "akash"
        },
        {
          "user_contact": 9898989898,
          "address_name": "Testing Edit Address",
          "address_type": "Home",
          "city": "Pune",
          "pincode": 123456,
          "address_id": 42,
          "phone_no": 8989898989,
          "state": "maharshtra",
          "name": null
        },
        {
          "user_contact": 9898989898,
          "address_name": "Testing Edit Address",
          "address_type": "Home",
          "city": "Pune",
          "pincode": 123456,
          "address_id": 43,
          "phone_no": 8989898989,
          "state": "maharshtra",
          "name": "akash"
        },
        {
          "user_contact": 9898989898,
          "address_name": "Testing Edit Address",
          "address_type": "Home",
          "city": "Pune",
          "pincode": 123456,
          "address_id": 44,
          "phone_no": 8989898989,
          "state": "maharshtra",
          "name": "akash"
        }
      ]
    };
  //   await DioClient()
  //       .get("https://oneart.onrender.com/getAllAddresses?userId=9898989898");
  return GetAllAddressModel.fromJson(response);
   }

  @override
  Future<EditAddressModel> editAddress(Map saveAddress, addressId) async {
    final response = {
      "detail": [
        {
          "type": "missing",
          "loc": [
            "body",
            "name"
          ],
          "msg": "Field required",
          "input": {
            "user_contact": "9898989898",
            "address_type": "other",
            "address_name": "other ghar",
            "phone_no": 8989898989,
            "city": "nagpur",
            "state": "maharashtra",
            "pincode": 440001
          },
          "url": "https://errors.pydantic.dev/2.1/v/missing"
        }
      ]
    };
    // await DioClient().put(
    //     "https://oneart.onrender.com/editAddress?addressId=$addressId",
    //     saveAddress);
    // log('response=========>$response');
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
