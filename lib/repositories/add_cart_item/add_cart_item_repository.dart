import '../../data/models/add_cart_items/add_cart_items_model.dart';
import '../../data/models/add_cart_items/decrement_cart_item_model.dart';
import '../../data/models/add_cart_items/delete_cart_item_model.dart';
import '../../data/models/add_cart_items/increment_cart_item_model.dart';

abstract class AddToCartRepository {
  Future<AddToCartModel> addToCart(Map cartdetails);

  Future<IncrementCartCountModel> incrementCartItemCount(
      Map incrementCountDetails, int cartItemId, int productId, int variantId);

  Future<DecrementCartCountModel> decrementCartItemCount(
      Map decrementCountDetails, int cartItemId, int productId, int variantId);

  Future<DeleteCartItemModel> deleteCartItem(deleteCartItemId);
}
