abstract class WishlistEvent {}

class GetAllWishlistItems extends WishlistEvent {}

class AddWishlist extends WishlistEvent {
  final int productId;
  final int variantId;

  AddWishlist({
    required this.productId,
    required this.variantId,
  });
}

class DeleteWishlist extends WishlistEvent {
  final String deleteId;
  final int productId;
  final int variantId;

  DeleteWishlist(this.productId, this.variantId, {required this.deleteId});
}

class GetWishlistCategory extends WishlistEvent {}
