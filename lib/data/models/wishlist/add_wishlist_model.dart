import 'dart:convert';

AddWishlistModel addWishlistModelFromJson(String str) =>
    AddWishlistModel.fromJson(json.decode(str));

String addWishlistModelToJson(AddWishlistModel data) =>
    json.encode(data.toJson());

class AddWishlistModel {
  final String status;
  final String message;
  final Data data;

  AddWishlistModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddWishlistModel.fromJson(Map<String, dynamic> json) =>
      AddWishlistModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  final int productId;
  final int favItemId;
  final int userId;
  final int variantId;
  final int shopId;

  Data({
    required this.productId,
    required this.favItemId,
    required this.userId,
    required this.variantId,
    required this.shopId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        productId: json["product_id"],
        favItemId: json["fav_item_id"],
        userId: json["user_id"],
        variantId: json["variant_id"],
        shopId: json["shop_id"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "fav_item_id": favItemId,
        "user_id": userId,
        "variant_id": variantId,
        "shop_id": shopId,
      };
}
