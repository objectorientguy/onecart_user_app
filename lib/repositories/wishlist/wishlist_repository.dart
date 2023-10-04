import '../../data/models/wishlist/add_wishlist_model.dart';
import '../../data/models/wishlist/delete_wishlist_model.dart';
import '../../data/models/wishlist/view_wishlist_model.dart';

abstract class ViewWishlistRepository {
  Future<ViewWishlistModel> getAllWishlistItems();

  Future<AddWishlistModel> addWishlistItems(Map wishlistDetails);

  Future<DeleteWishlistModel> deleteWishlistItems(int productId, int variantId);
}
