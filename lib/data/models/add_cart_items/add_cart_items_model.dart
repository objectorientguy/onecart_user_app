import 'dart:convert';

AddToCartModel addToCartModelFromJson(String str) =>
    AddToCartModel.fromJson(json.decode(str));

String addToCartModelToJson(AddToCartModel data) => json.encode(data.toJson());

class AddToCartModel {
  final int status;
  final String message;
  final Data data;

  AddToCartModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddToCartModel.fromJson(Map<String, dynamic> json) => AddToCartModel(
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
  final CartData cartData;
  final int cartItemQuantityCount;
  final int cartItemCount;

  Data({
    required this.cartData,
    required this.cartItemQuantityCount,
    required this.cartItemCount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        cartData: CartData.fromJson(json["cart_data"]),
        cartItemQuantityCount: json["cart_item_quantity_count"],
        cartItemCount: json["cart_item_count"],
      );

  Map<String, dynamic> toJson() => {
        "cart_data": cartData.toJson(),
        "cart_item_quantity_count": cartItemQuantityCount,
        "cart_item_count": cartItemCount,
      };
}

class CartData {
  final int cartId;
  final int productId;
  final int variantId;
  final int cartItemId;
  final int count;
  final Variant variant;

  CartData({
    required this.cartId,
    required this.productId,
    required this.variantId,
    required this.cartItemId,
    required this.count,
    required this.variant,
  });

  factory CartData.fromJson(Map<String, dynamic> json) => CartData(
        cartId: json["cart_id"],
        productId: json["product_id"],
        variantId: json["variant_id"],
        cartItemId: json["cartItem_id"],
        count: json["count"],
        variant: Variant.fromJson(json["variant"]),
      );

  Map<String, dynamic> toJson() => {
        "cart_id": cartId,
        "product_id": productId,
        "variant_id": variantId,
        "cartItem_id": cartItemId,
        "count": count,
        "variant": variant.toJson(),
      };
}

class Variant {
  final double variantCost;
  final int variantId;
  final double discountedCost;
  final String quantity;
  final List<String> image;
  final int productId;
  final String brandName;
  final int count;
  final int discount;
  final String description;
  final int ratings;

  Variant({
    required this.variantCost,
    required this.variantId,
    required this.discountedCost,
    required this.quantity,
    required this.image,
    required this.productId,
    required this.brandName,
    required this.count,
    required this.discount,
    required this.description,
    required this.ratings,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        variantCost: json["variant_cost"],
        variantId: json["variant_id"],
        discountedCost: json["discounted_cost"],
        quantity: json["quantity"],
        image: List<String>.from(json["image"].map((x) => x)),
        productId: json["product_id"],
        brandName: json["brand_name"],
        count: json["count"],
        discount: json["discount"],
        description: json["description"],
        ratings: json["ratings"],
      );

  Map<String, dynamic> toJson() => {
        "variant_cost": variantCost,
        "variant_id": variantId,
        "discounted_cost": discountedCost,
        "quantity": quantity,
        "image": List<dynamic>.from(image.map((x) => x)),
        "product_id": productId,
        "brand_name": brandName,
        "count": count,
        "discount": discount,
        "description": description,
        "ratings": ratings,
      };
}
