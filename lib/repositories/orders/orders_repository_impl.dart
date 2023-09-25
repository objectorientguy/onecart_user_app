import '../../data/models/orders/get_all_orders_model.dart';
import '../../data/models/orders/order_details_model.dart';
import '../../utils/dio_client.dart';
import 'orders_repository.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  @override
  Future<GetAllOrdersListModel> getAllOrders() async {
    final response = await DioClient().get(
        "https://oneart.onrender.com/orderlist?customer_contact=9898989898");
    return GetAllOrdersListModel.fromJson(response);
  }

  @override
  Future<OrderDetailsModel> getOrdersDetails() async {
    final response = await DioClient()
        .get("https://oneart.onrender.com/orderdetails?booking_id=1");
    return OrderDetailsModel.fromJson(response);
  }
}
