import '../../data/models/add_cart_items/add_cart_items_model.dart';
import '../../data/models/add_cart_items/decrement_cart_item_model.dart';
import '../../data/models/add_cart_items/delete_cart_item_model.dart';
import '../../data/models/add_cart_items/increment_cart_item_model.dart';
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

  @override
  Future<IncrementCartCountModel> incrementCartItemCount(
      int cartItemId, int productId, int variantId) async {
    final response = await DioClient().put(
        "https://oneart.onrender.com/increment_cart_item_count?cart_item_id=$cartItemId&product_id=$productId&variant_id=$variantId",
        {});
    return IncrementCartCountModel.fromJson(response);
  }

  @override
  Future<DecrementCartCountModel> decrementCartItemCount(
      int cartItemId, int productId, int variantId) async {
    final response = await DioClient().put(
        "https://oneart.onrender.com/decrement_cart_item_count?cart_item_id=$cartItemId&product_id=$productId&variant_id=$variantId",
        {});
    return DecrementCartCountModel.fromJson(response);
  }

  @override
  Future<DeleteCartItemModel> deleteCartItem(deleteCartItemId) async {
    try {
      final response = await DioClient().delete(
          "https://oneart.onrender.com/delete_cart_item?cart_item_id=$deleteCartItemId");
      return DeleteCartItemModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}
