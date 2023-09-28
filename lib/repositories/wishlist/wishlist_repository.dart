import '../../data/models/wishlist/add_wishlist_model.dart';

import '../../data/models/wishlist/delete_wishlist_model.dart';
import '../../data/models/wishlist/view_wishlist_model.dart';
import '../../data/models/wishlist/wishlist_category_model.dart';

abstract class ViewWishlistRepository {
  Future<WishlistAllModel> getAllWishlistItems();

  Future<AddWishlistModel> addWishlistItems(Map wishlistDetails);

  Future<DeleteWishlistModel> deleteWishlistItems(deleteWishlistId);
  Future<WishlistCategoryModel> wishlistCategoryModel();
}
