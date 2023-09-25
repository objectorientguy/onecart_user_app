// To parse this JSON data, do
//
//     final getAllOrdersListModel = getAllOrdersListModelFromJson(jsonString);
import 'dart:convert';

GetAllOrdersListModel getAllOrdersListModelFromJson(String str) =>
    GetAllOrdersListModel.fromJson(json.decode(str));

String getAllOrdersListModelToJson(GetAllOrdersListModel data) =>
    json.encode(data.toJson());

class GetAllOrdersListModel {
  final int status;
  final String message;
  final Data data;

  GetAllOrdersListModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetAllOrdersListModel.fromJson(Map<String, dynamic> json) =>
      GetAllOrdersListModel(
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
  final List<Order> orders;

  Data({
    required this.orders,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
      };
}

class Order {
  final int orderId;
  final String orderStatus;
  final String image;
  final String category;
  final int itemCount;

  Order({
    required this.orderId,
    required this.orderStatus,
    required this.image,
    required this.category,
    required this.itemCount,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderId: json["order_id"],
        orderStatus: json["order_status"],
        image: json["image"],
        category: json["category"],
        itemCount: json["item_count"],
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "order_status": orderStatus,
        "image": image,
        "category": category,
        "item_count": itemCount,
      };
}
