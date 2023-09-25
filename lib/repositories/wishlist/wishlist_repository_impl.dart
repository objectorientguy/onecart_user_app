import 'package:onecart_user_app/repositories/wishlist/wishlist_repository.dart';

import 'package:onecart_user_app/utils/dio_client.dart';

import '../../data/models/wishlist/add_wishlist_model.dart';

import '../../data/models/wishlist/delete_wishlist_model.dart';
import '../../data/models/wishlist/view_wishlist_model.dart';

class ViewWishlistRepositoryImpl implements ViewWishlistRepository {
  @override
  Future<WishlistModel> getAllWishlistItems() async {
    final response = await DioClient()
        .get("https://oneart.onrender.com/getall_favitem/9898989898");
    return WishlistModel.fromJson(response);
  }

  @override
  Future<AddWishlistModel> addWishlistItems(Map wishlistDetails) async {
    final response = await DioClient().post(
        "https://oneart.onrender.com/favitem?user_id=9898989898",
        wishlistDetails);
    return AddWishlistModel.fromJson(response);
  }

  @override
  Future<DeleteWishlistModel> deleteWishlistItems(deleteWishlistId) async {
    try {
      final response = await DioClient()
          .delete("https://oneart.onrender.com/favitem/$deleteWishlistId");
      return DeleteWishlistModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}
