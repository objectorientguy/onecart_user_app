import 'package:onecart_user_app/repositories/wishlist/wishlist_repository.dart';
import 'package:onecart_user_app/utils/dio_client.dart';
import '../../data/models/wishlist/add_wishlist_model.dart';
import '../../data/models/wishlist/delete_wishlist_model.dart';
import '../../data/models/wishlist/view_wishlist_model.dart';
import '../../data/models/wishlist/wishlist_category_model.dart';

class ViewWishlistRepositoryImpl implements ViewWishlistRepository {
  @override
  Future<WishlistAllModel> getAllWishlistItems() async {
    final response = await DioClient()
        .get("https://oneart.onrender.com/get_all_favitem?user_id=9898989898");
    return WishlistAllModel.fromJson(response);
  }

  @override
  Future<WishlistCategoryModel> wishlistCategoryModel() async {
    final response = await DioClient()
        .get("https://oneart.onrender.com/get_Categories_Id_name");
    return WishlistCategoryModel.fromJson(response);
  }

  @override
  Future<AddWishlistModel> addWishlistItems(Map wishlistDetails) async {
    final response =
    await DioClient().post(
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
