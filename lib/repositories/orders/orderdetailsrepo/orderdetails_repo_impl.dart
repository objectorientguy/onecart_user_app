import 'package:onecart_user_app/repositories/orders/orderdetailsrepo/orderdetails_repo.dart';

import '../../../data/models/orders/order_details_model.dart';
import '../../../utils/dio_client.dart';

class OrdersRepositoryDetailsImpl implements OrdersDetailsRepository {
  @override
  Future<GetOrdersDetailsModel> getAllOrdersDetails() async {
    final response =
    await DioClient().get("https://oneart.onrender.com/order_details/3");
    return GetOrdersDetailsModel.fromJson(response);
  }
}
