
import 'dart:convert';

WishlistAllModel wishlistAllModelFromJson(String str) => WishlistAllModel.fromJson(json.decode(str));

String wishlistAllModelToJson(WishlistAllModel data) => json.encode(data.toJson());

class WishlistAllModel {
  final int status;
  final String message;
  final WishlistDatum data;

  WishlistAllModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory WishlistAllModel.fromJson(Map<String, dynamic> json) => WishlistAllModel(
    status: json["status"],
    message: json["message"],
    data: WishlistDatum.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class WishlistDatum {
  final List<All> all;

  WishlistDatum({
    required this.all,
  });

  factory WishlistDatum.fromJson(Map<String, dynamic> json) => WishlistDatum(
    all: List<All>.from(json["All"].map((x) => All.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "All": List<dynamic>.from(all.map((x) => x.toJson())),
  };
}

class All {
  final int categoryId;
  final String categoryName;
  final List<FavItem> favItems;

  All({
    required this.categoryId,
    required this.categoryName,
    required this.favItems,
  });

  factory All.fromJson(Map<String, dynamic> json) => All(
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
  final List<String> image;
  final double variantCost;
  final double discountedCost;
  final int discount;
  final String quantity;
  final int variantId;

  FavItem({
    required this.favItemId,
    required this.productId,
    required this.productName,
    required this.image,
    required this.variantCost,
    required this.discountedCost,
    required this.discount,
    required this.quantity,
    required this.variantId,
  });

  factory FavItem.fromJson(Map<String, dynamic> json) => FavItem(
    favItemId: json["fav_item_id"],
    productId: json["product_id"],
    productName: json["product_name"],
    image: List<String>.from(json["image"].map((x) => x)),
    variantCost: json["variant_cost"],
    discountedCost: json["discounted_cost"],
    discount: json["discount"],
    quantity: json["quantity"],
    variantId: json["variant_id"],
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
  };
}
