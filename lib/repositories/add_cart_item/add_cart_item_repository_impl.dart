import 'dart:developer';
import '../../data/models/add_cart_items/add_cart_items_model.dart';
import '../../utils/dio_client.dart';
import 'add_cart_item_repository.dart';

class AddToCartRepositoryImpl implements AddToCartRepository {
  @override
  Future<AddToCartModel> addItemsToCart(Map cartDetails) async {
    final response = await DioClient()
        .post("https://oneart.onrender.com/carts/Items", cartDetails);
    log('response=========>$response');
    return AddToCartModel.fromJson(response);
  }


}
