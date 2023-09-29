abstract class CartEvents {}

class AddItemsToCart extends CartEvents {
  final int prodId;
  final int variantId;

  AddItemsToCart({required this.prodId, required this.variantId});
}

class IncrementProductCounter extends CartEvents {
  int count;
  final int productId;
  final int variantId;

  IncrementProductCounter(
      {required this.productId, required this.variantId, required this.count});
}

class DecrementProductCounter extends CartEvents {
  int count;
  final int productId;
  final int variantId;

  DecrementProductCounter(
      {required this.productId, required this.variantId, required this.count});
}

class IncrementCartItemCount extends CartEvents {
  final int productId;
  final int variantId;

  IncrementCartItemCount({
    required this.variantId,
    required this.productId,
  });
}

class DecrementCartItemCount extends CartEvents {
  final int productId;
  final int variantId;

  DecrementCartItemCount({
    required this.variantId,
    required this.productId,
  });
}

class DeleteCartItem extends CartEvents {
  final int productId;
  final int variantId;

  DeleteCartItem({required this.productId, required this.variantId});
}
