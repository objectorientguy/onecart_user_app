import 'dart:convert';

WishlistModel wishlistModelFromJson(String str) =>
    WishlistModel.fromJson(json.decode(str));

String wishlistModelToJson(WishlistModel data) => json.encode(data.toJson());

class WishlistModel {
  final String status;
  final String message;
  final List<WishlistData> data;

  WishlistModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory WishlistModel.fromJson(Map<String, dynamic> json) => WishlistModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<WishlistData>.from(
                json["data"].map((x) => WishlistData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class WishlistData {
  final int productId;
  final String productName;
  final String image;
  final double variantCost;
  final double discountedCost;
  final int discount;
  final String quantity;
  final int variantId;

  WishlistData({
    required this.productId,
    required this.productName,
    required this.image,
    required this.variantCost,
    required this.discountedCost,
    required this.discount,
    required this.quantity,
    required this.variantId,
  });

  factory WishlistData.fromJson(Map<String, dynamic> json) => WishlistData(
        productId: json["product_id"],
        productName: json["product_name"],
        image: json["image"],
        variantCost: json["variant_cost"],
        discountedCost: json["discounted_cost"],
        discount: json["discount"],
        quantity: json["quantity"],
        variantId: json["variant_id"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "image": image,
        "variant_cost": variantCost,
        "discounted_cost": discountedCost,
        "discount": discount,
        "quantity": quantity,
        "variant_id": variantId,
      };
}
