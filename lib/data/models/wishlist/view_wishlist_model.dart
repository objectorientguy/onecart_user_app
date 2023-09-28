import 'dart:convert';

WishlistAllModel wishlistAllModelFromJson(String str) => WishlistAllModel.fromJson(json.decode(str));

String wishlistAllModelToJson(WishlistAllModel data) => json.encode(data.toJson());

class WishlistAllModel {
  final int status;
  final String message;
  final List<WishlistDatum> data;

  WishlistAllModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory WishlistAllModel.fromJson(Map<String, dynamic> json) => WishlistAllModel(
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
  final int categoryId;
  final String categoryName;
  final List<FavItem> favItems;

  WishlistDatum({
    required this.categoryId,
    required this.categoryName,
    required this.favItems,
  });

  factory WishlistDatum.fromJson(Map<String, dynamic> json) => WishlistDatum(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    favItems: List<FavItem>.from(json["fav_items"].map((x) => FavItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "fav_items": List<dynamic>.from(favItems.map((x) => x.toJson())),
  };
}

class FavItem {
  final int favItemId;
  final int productId;
  final String productName;
  final int variantId;
  final int variantCost;
  final int discountedCost;
  final int discount;
  final String quantity;
  final List<String> image;

  FavItem({
    required this.favItemId,
    required this.productId,
    required this.productName,
    required this.variantId,
    required this.variantCost,
    required this.discountedCost,
    required this.discount,
    required this.quantity,
    required this.image,
  });

  factory FavItem.fromJson(Map<String, dynamic> json) => FavItem(
    favItemId: json["fav_item_id"],
    productId: json["product_id"],
    productName: json["product_name"],
    variantId: json["variant_id"],
    variantCost: json["variant_cost"],
    discountedCost: json["discounted_cost"],
    discount: json["discount"],
    quantity: json["quantity"],
    image: List<String>.from(json["image"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "fav_item_id": favItemId,
    "product_id": productId,
    "product_name": productName,
    "variant_id": variantId,
    "variant_cost": variantCost,
    "discounted_cost": discountedCost,
    "discount": discount,
    "quantity": quantity,
    "image": List<dynamic>.from(image.map((x) => x)),
  };
}
