import 'dart:developer';
import '../../data/models/add_cart_items/add_cart_items_model.dart';
import '../../utils/dio_client.dart';
import 'add_cart_item_repository.dart';

class AddToCartRepositoryImpl implements AddToCartRepository {
  Future<AddToCartModel> addToCart(Map cartdetails) async {
    final response = await DioClient()
        .post("https://oneart.onrender.com/add_to_cart/1", cartdetails);
    log('response=========>$response');
    return AddToCartModel.fromJson(response);
  }

  @override
  Future<AddToCartModel> addItemsToCart() {
    throw UnimplementedError();
  }
}
