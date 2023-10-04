import 'dart:convert';

ViewWishlistModel viewWishlistModelFromJson(String str) =>
    ViewWishlistModel.fromJson(json.decode(str));

String viewWishlistModelToJson(ViewWishlistModel data) =>
    json.encode(data.toJson());

class ViewWishlistModel {
  final int status;
  final String message;
  final List<WishlistData> data;
  final int cartItemCount;

  ViewWishlistModel({
    required this.status,
    required this.message,
    required this.data,
    required this.cartItemCount,
  });

  factory ViewWishlistModel.fromJson(Map<String, dynamic> json) =>
      ViewWishlistModel(
        status: json["status"],
        message: json["message"],
        data: List<WishlistData>.from(
            json["data"].map((x) => WishlistData.fromJson(x))),
        cartItemCount: json["cart_item_count"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "cart_item_count": cartItemCount,
      };
}

class WishlistData {
  final int favItemId;
  final int productId;
  final String productName;
  final List<String> image;
  final String brand;
  final double variantCost;
  final double discountedCost;
  final int discount;
  final String quantity;
  final int variantId;
  final int categoryId;
  final int count;
  final int cartItemQuantityCount;

  WishlistData({
    required this.favItemId,
    required this.productId,
    required this.productName,
    required this.image,
    required this.brand,
    required this.variantCost,
    required this.discountedCost,
    required this.discount,
    required this.quantity,
    required this.variantId,
    required this.categoryId,
    required this.count,
    required this.cartItemQuantityCount,
  });

  factory WishlistData.fromJson(Map<String, dynamic> json) => WishlistData(
        favItemId: json["fav_item_id"],
        productId: json["product_id"],
        productName: json["product_name"],
        image: List<String>.from(json["image"].map((x) => x)),
        brand: json["brand"],
        variantCost: json["variant_cost"],
        discountedCost: json["discounted_cost"],
        discount: json["discount"],
        quantity: json["quantity"],
        variantId: json["variant_id"],
        categoryId: json["category_id"],
        count: json["count"],
        cartItemQuantityCount: json["cart_item_quantity_count"],
      );

  Map<String, dynamic> toJson() => {
        "fav_item_id": favItemId,
        "product_id": productId,
        "product_name": productName,
        "image": List<dynamic>.from(image.map((x) => x)),
        "brand": brand,
        "variant_cost": variantCost,
        "discounted_cost": discountedCost,
        "discount": discount,
        "quantity": quantity,
        "variant_id": variantId,
        "category_id": categoryId,
        "count": count,
        "cart_item_quantity_count": cartItemQuantityCount,
      };
}
