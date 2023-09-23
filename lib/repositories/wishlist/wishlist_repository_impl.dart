import 'package:onecart_user_app/repositories/wishlist/wishlist_repository.dart';

import 'package:onecart_user_app/utils/dio_client.dart';

import '../../data/models/wishlist/add_wishlist_model.dart';

import '../../data/models/wishlist/view_wishlist_model.dart';

class ViewWishlistRepositoryImpl implements ViewWishlistRepository {
  @override
  Future<WishlistModel> getAllWishlistItems() async {
    final response = {
      "status": "200",
      "message": "Customer's favorite items retrieved successfully",
      "data": [
        {
          "product_id": 2,
          "product_name": "shoes",
          "image": "image2.png",
          "variant_cost": 100.0,
          "discounted_cost": 10.0,
          "discount": 10,
          "quantity": "2",
          "variant_id": 2
        },
        {
          "product_id": 1,
          "product_name": "chips",
          "image": "image1.png",
          "variant_cost": 10.0,
          "discounted_cost": 0.0,
          "discount": 0,
          "quantity": "1",
          "variant_id": 1
        }
      ]
    };
    return WishlistModel.fromJson(response);
  }

  @override
  Future<AddWishlistModel> addWishlistItems(Map wishlistDetails) async {
    final response = await DioClient().get(
        "https://oneart.onrender.com/favitem?user_id=9898989898",
        wishlistDetails);
    return AddWishlistModel.fromJson(response);
  }
}
