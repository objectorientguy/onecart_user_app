import 'package:onecart_user_app/repositories/view_cart/view_cart_repository.dart';

import '../../data/models/view_cart/view_cart_model.dart';
import '../../utils/dio_client.dart';

class ViewCartRepositoryImpl implements ViewCartRepository {
  @override
  Future<ViewCartModel> getAllCartItems(int cartId) async {
    final response = await DioClient()
        .get("https://oneart.onrender.com/getProductswithCartId/$cartId");
    return ViewCartModel.fromJson(response);
  }
}
