import 'dart:developer';
import '../../data/models/add_cart_items/add_cart_items_model.dart';
import '../../utils/dio_client.dart';
import 'add_cart_item_repository.dart';

class AddToCartRepositoryImpl implements AddToCartRepository {

  Future<AddToCartModel> addToCart(Map cartdetails,cartId) async {
    final response = await DioClient().post(
        "https://oneart.onrender.com/carts/Items=$cartId",cartdetails);
    log('response=========>$response');
    return AddToCartModel.fromJson(response);
  }

  @override
  Future<AddToCartModel> addItemsToCart() {
    // TODO: implement addItemsToCart
    throw UnimplementedError();
  }
}
