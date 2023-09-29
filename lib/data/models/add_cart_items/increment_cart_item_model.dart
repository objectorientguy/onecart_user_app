import 'dart:convert';

IncrementCartCountModel incrementCartCountModelFromJson(String str) =>
    IncrementCartCountModel.fromJson(json.decode(str));

String incrementCartCountModelToJson(IncrementCartCountModel data) =>
    json.encode(data.toJson());

class IncrementCartCountModel {
  final int status;
  final String message;
  final IncrementCountData data;

  IncrementCartCountModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory IncrementCartCountModel.fromJson(Map<String, dynamic> json) =>
      IncrementCartCountModel(
        status: json["status"],
        message: json["message"],
        data: IncrementCountData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class IncrementCountData {
  final CartItem cartItem;

  IncrementCountData({
    required this.cartItem,
  });

  factory IncrementCountData.fromJson(Map<String, dynamic> json) =>
      IncrementCountData(
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
