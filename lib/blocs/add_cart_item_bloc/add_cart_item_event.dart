abstract class CartEvents {}

class AddItemsToCart extends CartEvents {
  final int prodId;
  final int variantId;

  AddItemsToCart({required this.prodId, required this.variantId});
}

class IncrementCartItemCount extends CartEvents {
  final int cartItemId;
  final int productId;
  final int variantId;

  IncrementCartItemCount(
      {required this.variantId,
      required this.productId,
      required this.cartItemId});
}

class DecrementCartItemCount extends CartEvents {
  final int cartItemId;
  final int productId;
  final int variantId;

  DecrementCartItemCount(
      {required this.variantId,
      required this.productId,
      required this.cartItemId});
}

class DeleteCartItem extends CartEvents {
  final String deleteId;

  DeleteCartItem({required this.deleteId});
}
