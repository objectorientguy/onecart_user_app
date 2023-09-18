import '../../data/models/add_cart_items/add_cart_items_model.dart';

abstract class AddToCartEvents {}

class AddItemsToCart extends AddToCartEvents {
  final CartData data;

  AddItemsToCart({required this.data});
}
