import 'package:onecart_user_app/repositories/view_cart/view_cart_repository.dart';

import '../../data/models/view_cart/view_cart_model.dart';
import '../../utils/dio_client.dart';

class ViewCartRepositoryImpl implements ViewCartRepository {
  @override
  Future<ViewCartModel> getAllCartItems() async {
    final response = await DioClient()
        .get("https://oneart.onrender.com/getProductswithCartId/1");
    return ViewCartModel.fromJson(response);
  }
}
