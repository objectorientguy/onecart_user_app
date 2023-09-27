import 'dart:convert';

DecrementCartCountModel decrementCartCountModelFromJson(String str) =>
    DecrementCartCountModel.fromJson(json.decode(str));

String decrementCartCountModelToJson(DecrementCartCountModel data) =>
    json.encode(data.toJson());

class DecrementCartCountModel {
  final int status;
  final String message;
  final DecrementCountData data;

  DecrementCartCountModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DecrementCartCountModel.fromJson(Map<String, dynamic> json) =>
      DecrementCartCountModel(
        status: json["status"],
        message: json["message"],
        data: DecrementCountData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class DecrementCountData {
  final CartItem cartItem;

  DecrementCountData({
    required this.cartItem,
  });

  factory DecrementCountData.fromJson(Map<String, dynamic> json) =>
      DecrementCountData(
        cartItem: CartItem.fromJson(json["cart_item"]),
      );

  Map<String, dynamic> toJson() => {
        "cart_item": cartItem.toJson(),
      };
}

class CartItem {
  CartItem();

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem();

  Map<String, dynamic> toJson() => {};
}
