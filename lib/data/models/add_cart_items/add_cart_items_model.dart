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
  final int cartItemId;
  final int count;
  final int cartId;
  final int productId;
  final int variantId;

  Data({
    required this.cartItemId,
    required this.count,
    required this.cartId,
    required this.productId,
    required this.variantId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        cartItemId: json["cartItem_id"],
        count: json["count"],
        cartId: json["cart_id"],
        productId: json["product_id"],
        variantId: json["variant_id"],
      );

  Map<String, dynamic> toJson() => {
        "cartItem_id": cartItemId,
        "count": count,
        "cart_id": cartId,
        "product_id": productId,
        "variant_id": variantId,
      };
}
