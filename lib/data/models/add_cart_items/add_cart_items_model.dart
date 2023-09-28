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
        data: Data.fromJson(json["data"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  final CartData cartData;

  Data({
    required this.cartData,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        cartData: CartData.fromJson(json["cart_data"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "cart_data": cartData.toJson(),
      };
}

class CartData {
  final dynamic cartId;
  final dynamic productId;
  final dynamic variantId;
  final dynamic cartItemId;
  final dynamic count;

  CartData({
    required this.cartId,
    required this.productId,
    required this.variantId,
    required this.cartItemId,
    required this.count,
  });

  factory CartData.fromJson(Map<String, dynamic> json) => CartData(
        cartId: json["cart_id"],
        productId: json["product_id"],
        variantId: json["variant_id"],
        cartItemId: json["cartItem_id"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "cart_id": cartId,
        "product_id": productId,
        "variant_id": variantId,
        "cartItem_id": cartItemId,
        "count": count,
      };
}
