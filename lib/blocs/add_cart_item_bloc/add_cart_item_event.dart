abstract class AddToCartEvents {}

class AddItemsToCart extends AddToCartEvents {
  final int prodId;
  final int variantId;
  final int count;

  AddItemsToCart(
      {required this.prodId, required this.variantId, required this.count});
}
