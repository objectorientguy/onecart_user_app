import 'dart:convert';

WishlistModel wishlistModelFromJson(String str) => WishlistModel.fromJson(json.decode(str));

String wishlistModelToJson(WishlistModel data) => json.encode(data.toJson());

class WishlistModel {
  final String status;
  final String message;
  final List<WishlistDatum> data;

  WishlistModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory WishlistModel.fromJson(Map<String, dynamic> json) => WishlistModel(
    status: json["status"],
    message: json["message"],
    data: List<WishlistDatum>.from(json["data"].map((x) => WishlistDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class WishlistDatum {
  final int favItemId;
  final int productId;
  final String productName;
  final List<String> image;
  final int variantCost;
  final int discountedCost;
  final int discount;
  final String quantity;
  final int variantId;
  final int categoryId;
  final String categoryName;

  WishlistDatum({
    required this.favItemId,
    required this.productId,
    required this.productName,
    required this.image,
    required this.variantCost,
    required this.discountedCost,
    required this.discount,
    required this.quantity,
    required this.variantId,
    required this.categoryId,
    required this.categoryName,
  });

  factory WishlistDatum.fromJson(Map<String, dynamic> json) => WishlistDatum(
    favItemId: json["fav_item_id"],
    productId: json["product_id"],
    productName: json["product_name"],
    image: List<String>.from(json["image"].map((x) => x)),
    variantCost: json["variant_cost"],
    discountedCost: json["discounted_cost"],
    discount: json["discount"],
    quantity: json["quantity"],
    variantId: json["variant_id"],
    categoryId: json["category_id"],
    categoryName: json["category_name"],
  );

  Map<String, dynamic> toJson() => {
    "fav_item_id": favItemId,
    "product_id": productId,
    "product_name": productName,
    "image": List<dynamic>.from(image.map((x) => x)),
    "variant_cost": variantCost,
    "discounted_cost": discountedCost,
    "discount": discount,
    "quantity": quantity,
    "variant_id": variantId,
    "category_id": categoryId,
    "category_name": categoryName,
  };
}
