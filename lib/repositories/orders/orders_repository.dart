import '../../data/models/orders/get_all_orders_model.dart';

abstract class OrdersRepository {
  Future<GetAllOrdersListModel> getAllOrders();
}
