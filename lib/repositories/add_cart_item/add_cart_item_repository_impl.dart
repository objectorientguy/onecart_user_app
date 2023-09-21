import '../../data/models/add_cart_items/add_cart_items_model.dart';
import '../../utils/dio_client.dart';
import 'add_cart_item_repository.dart';

class AddToCartRepositoryImpl implements AddToCartRepository {
  @override
  Future<AddToCartModel> addToCart(Map cartdetails) async {
    final response = await DioClient().post(
        "https://oneart.onrender.com/add_to_cart?customer_contact=9898989898",
        cartdetails);

    return AddToCartModel.fromJson(response);
  }
}
