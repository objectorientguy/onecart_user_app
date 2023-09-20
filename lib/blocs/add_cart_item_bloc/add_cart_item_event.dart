abstract class AddToCartEvents {}

class AddItemsToCart extends AddToCartEvents {
  final int prodId;
  final int variantId;
  final int count;

  //final CartData data;

  AddItemsToCart(
      {required this.prodId, required this.variantId, required this.count});
}
