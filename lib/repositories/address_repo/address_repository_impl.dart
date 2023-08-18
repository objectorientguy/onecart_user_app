import '../../data/models/address_model/address_model.dart';
import '../../utils/dio_client.dart';
import 'address_repository.dart';

class AddressRepositoryImpl implements AddressRepository {
  @override
  Future<GetAllAddressModel> fetchAddress() async {
    final response =
    await DioClient().get("https://oneart.onrender.com/getAllAddresses?userId=9898989898");
    return GetAllAddressModel.fromJson(response);
  }
}