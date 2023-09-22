import '../../data/models/wishlist/add_wishlist_model.dart';
import '../../data/models/wishlist/view_wishlist_model.dart';

abstract class ViewWishlistRepository {
  Future<WishlistModel> getAllWishlistItems();

  Future<AddWishlistModel> addWishlistItems(Map wishlistDetails);
}
