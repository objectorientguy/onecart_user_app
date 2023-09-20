import '../../../data/models/orders/order_details_model.dart';

abstract class OrdersDetailsRepository {
  Future<GetOrdersDetailsModel> getAllOrdersDetails();
}
