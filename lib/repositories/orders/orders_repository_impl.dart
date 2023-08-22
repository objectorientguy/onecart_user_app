import '../../data/models/orders/get_all_orders_model.dart';
import '../../utils/dio_client.dart';
import 'orders_repository.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  @override
  Future<GetAllOrdersListModel> getAllOrders() async {
    final response =
        await DioClient().get("https://oneart.onrender.com/getOrders");
    return GetAllOrdersListModel.fromJson(response);
  }
}
