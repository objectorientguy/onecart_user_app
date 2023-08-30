import '../../data/models/add_cart_items/add_cart_items_model.dart';

abstract class AddToCartRepository {
  Future<AddToCartModel> addItemsToCart(Map cartDetails);
}
