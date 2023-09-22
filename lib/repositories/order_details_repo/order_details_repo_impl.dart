import '../../../data/models/orders/order_details_model.dart';
import '../../../utils/dio_client.dart';
import 'oder_details_repository.dart';

class OrdersRepositoryDetailsImpl implements OrdersDetailsRepository {
  @override
  Future<OrderDetailsModel> getOrdersDetails() async {
    final response =
    await DioClient().get("https://oneart.onrender.com/orderdetails?booking_id=1");
    return OrderDetailsModel.fromJson(response);
  }
}
