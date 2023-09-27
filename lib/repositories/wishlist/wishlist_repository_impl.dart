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
    final response = {
      "status": "200",
      "message": "Customer's favorite items retrieved successfully",
      "data": {
        "all": [
          {
            "fav_item_id": 148,
            "product_id": 8,
            "product_name": "Cerelac Baby Cereal with Milk Wheat Apple 6 months (Stage 1) 300 g",
            "image": [
              "https://oneart.onrender.com/images/cerelac-baby-cereal-with-milk-wh",
              "https://oneart.onrender.com/images/cerelac-baby-cereal-with-milk-wh-b",
              "https://oneart.onrender.com/images/cerelac-baby-cereal-with-milk-wh-s"
            ],
            "variant_cost": 260.0,
            "discounted_cost": 260.0,
            "discount": 0,
            "quantity": "300 g",
            "variant_id": 8,
            "category_id": 1,
            "category_name": "Snacks"
          },
          {
            "fav_item_id": 149,
            "product_id": 3,
            "product_name": "Pepsi 7up",
            "image": [
              "https://oneart.onrender.com/images/7up-2-25-l.jpeg",
              "https://oneart.onrender.com/images/7up-2-25-l-back.jpeg",
              "https://oneart.onrender.com/images/7up-2-25-l-legals.jpeg"
            ],
            "variant_cost": 99.0,
            "discounted_cost": 66.0,
            "discount": 33,
            "quantity": "2.2 l",
            "variant_id": 1,
            "category_id": null,
            "category_name": null
          },
          {
            "fav_item_id": 150,
            "product_id": 4,
            "product_name": "Amul Lassi",
            "image": [
              "https://oneart.onrender.com/images/amul-lassi-250-ml-tetra-pak-prod.jpg",
              "https://oneart.onrender.com/images/amul-lassi-250-ml-tetra-info.jpg",
              "https://oneart.onrender.com/images/amul-lassi-250-ml-tetra-pak-lega.jpg"
            ],
            "variant_cost": 90.0,
            "discounted_cost": 90.0,
            "discount": 10,
            "quantity": "250 ml",
            "variant_id": 5,
            "category_id": 5,
            "category_name": "Beverages"
          }
        ],
        "categories": [
          {
            "fav_item_id": 148,
            "product_id": 8,
            "product_name": "Cerelac Baby Cereal with Milk Wheat Apple 6 months (Stage 1) 300 g",
            "image": [
              "https://oneart.onrender.com/images/cerelac-baby-cereal-with-milk-wh",
              "https://oneart.onrender.com/images/cerelac-baby-cereal-with-milk-wh-b",
              "https://oneart.onrender.com/images/cerelac-baby-cereal-with-milk-wh-s"
            ],
            "variant_cost": 260.0,
            "discounted_cost": 260.0,
            "discount": 0,
            "quantity": "300 g",
            "variant_id": 8,
            "category_id": 1,
            "category_name": "Snacks"
          },
          {
            "fav_item_id": 149,
            "product_id": 3,
            "product_name": "Pepsi 7up",
            "image": [
              "https://oneart.onrender.com/images/7up-2-25-l.jpeg",
              "https://oneart.onrender.com/images/7up-2-25-l-back.jpeg",
              "https://oneart.onrender.com/images/7up-2-25-l-legals.jpeg"
            ],
            "variant_cost": 99.0,
            "discounted_cost": 66.0,
            "discount": 33,
            "quantity": "2.2 l",
            "variant_id": 1,
            "category_id": null,
            "category_name": null
          },
          {
            "fav_item_id": 150,
            "product_id": 4,
            "product_name": "Amul Lassi",
            "image": [
              "https://oneart.onrender.com/images/amul-lassi-250-ml-tetra-pak-prod.jpg",
              "https://oneart.onrender.com/images/amul-lassi-250-ml-tetra-info.jpg",
              "https://oneart.onrender.com/images/amul-lassi-250-ml-tetra-pak-lega.jpg"
            ],
            "variant_cost": 90.0,
            "discounted_cost": 90.0,
            "discount": 10,
            "quantity": "250 ml",
            "variant_id": 5,
            "category_id": 5,
            "category_name": "Beverages"
          }
        ]
      }
    };
    // await DioClient().post(
    //     "https://oneart.onrender.com/favitem?user_id=9898989898",
    //     wishlistDetails);
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
