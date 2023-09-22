
abstract class WishlistEvent {}

class GetAllWishlistItems extends WishlistEvent {}

class AddWishlist extends WishlistEvent {
  final int productId;
  final int variantId;
  final int shopId;
  final int userId;

  AddWishlist({
    required this.productId,
    required this.variantId,
    required this.shopId,
    required this.userId,
  });
}

