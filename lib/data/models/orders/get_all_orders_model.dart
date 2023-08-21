// To parse this JSON data, do
//
//     final getAllOrdersListModel = getAllOrdersListModelFromJson(jsonString);

import 'dart:convert';

GetAllOrdersListModel getAllOrdersListModelFromJson(String str) =>
    GetAllOrdersListModel.fromJson(json.decode(str));

String getAllOrdersListModelToJson(GetAllOrdersListModel data) =>
    json.encode(data.toJson());

class GetAllOrdersListModel {
  final int? status;
  final String? message;
  final List<OrderDatum>? data;

  GetAllOrdersListModel({
    this.status,
    this.message,
    this.data,
  });

  factory GetAllOrdersListModel.fromJson(Map<String, dynamic> json) =>
      GetAllOrdersListModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<OrderDatum>.from(json["data"]!.map((x) => OrderDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class OrderDatum {
  final int? orderId;
  final int? userContact;
  final int? itemCount;
  final dynamic orderConfirmation;
  final dynamic orderShipped;
  final String? paymentType;
  final int? cartItemsId;
  final int? addressId;
  final DateTime? orderPlaced;
  final String? totalPrice;

  OrderDatum({
    this.orderId,
    this.userContact,
    this.itemCount,
    this.orderConfirmation,
    this.orderShipped,
    this.paymentType,
    this.cartItemsId,
    this.addressId,
    this.orderPlaced,
    this.totalPrice,
  });

  factory OrderDatum.fromJson(Map<String, dynamic> json) => OrderDatum(
        orderId: json["order_id"],
        userContact: json["user_contact"],
        itemCount: json["item_count"],
        orderConfirmation: json["order_confirmation"],
        orderShipped: json["order_shipped"],
        paymentType: json["payment_type"],
        cartItemsId: json["cartItems_id"],
        addressId: json["address_id"],
        orderPlaced: json["order_placed"] == null
            ? null
            : DateTime.parse(json["order_placed"]),
        totalPrice: json["total_price"],
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "user_contact": userContact,
        "item_count": itemCount,
        "order_confirmation": orderConfirmation,
        "order_shipped": orderShipped,
        "payment_type": paymentType,
        "cartItems_id": cartItemsId,
        "address_id": addressId,
        "order_placed": orderPlaced?.toIso8601String(),
        "total_price": totalPrice,
      };
}
