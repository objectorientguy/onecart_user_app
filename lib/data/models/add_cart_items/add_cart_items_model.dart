import 'dart:convert';

AddToCartModel addToCartModelFromJson(String str) =>
    AddToCartModel.fromJson(json.decode(str));

String addToCartModelToJson(AddToCartModel data) => json.encode(data.toJson());

class AddToCartModel {
  final String? status;
  final String? message;
  final AddToCartData? data;

  AddToCartModel({
    this.status,
    this.message,
    this.data,
  });

  factory AddToCartModel.fromJson(Map<String, dynamic> json) => AddToCartModel(
        status: json["status"],
        message: json["message"],
        data:
            json["data"] == null ? null : AddToCartData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class AddToCartData {
  final int? cartId;
  final int? cartItemId;
  final int? productId;
  final int? variantId;
  final int? itemCount;

  AddToCartData({
    this.cartId,
    this.cartItemId,
    this.productId,
    this.variantId,
    this.itemCount,
  });

  factory AddToCartData.fromJson(Map<String, dynamic> json) => AddToCartData(
        cartId: json["cart_id"],
        cartItemId: json["cartItemId"],
        productId: json["product_id"],
        variantId: json["variant_id"],
        itemCount: json["item_count"],
      );

  Map<String, dynamic> toJson() => {
        "cart_id": cartId,
        "cartItemId": cartItemId,
        "product_id": productId,
        "variant_id": variantId,
        "item_count": itemCount,
      };
}
