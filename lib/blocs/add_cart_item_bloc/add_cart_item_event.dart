abstract class CartEvents {}

class AddItemsToCart extends CartEvents {
  final int prodId;
  final int variantId;
  final int count;

  AddItemsToCart(
      {required this.prodId, required this.variantId, required this.count});
}

class IncrementCartItemCount extends CartEvents {
  final Map incrementCountDetails;
  final int cartItemId;
  final int productId;
  final int variantId;

  IncrementCartItemCount(
      {required this.incrementCountDetails,
      required this.variantId,
      required this.productId,
      required this.cartItemId});
}

class DecrementCartItemCount extends CartEvents {
  final Map decrementCountDetails;
  final int cartItemId;
  final int productId;
  final int variantId;

  DecrementCartItemCount(
      {required this.decrementCountDetails,
      required this.variantId,
      required this.productId,
      required this.cartItemId});
}

class DeleteCartItem extends CartEvents {
  final String deleteId;

  DeleteCartItem({required this.deleteId});
}
