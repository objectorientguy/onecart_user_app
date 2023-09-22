import '../../data/models/wishlist/view_wishlist_model.dart';

abstract class ViewWishlistRepository {
  Future<WishlistModel> getAllWishlistItems();
}
