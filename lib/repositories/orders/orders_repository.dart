import '../../data/models/orders/get_all_orders_model.dart';
import '../../data/models/orders/order_details_model.dart';

abstract class OrdersRepository {
  Future<GetAllOrdersListModel> getAllOrders();

  Future<OrderProductsModel> getOrdersDetails();
}
