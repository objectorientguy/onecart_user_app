// To parse this JSON data, do
//
//     final getAllOrdersListModel = getAllOrdersListModelFromJson(jsonString);
import 'dart:convert';

GetAllOrdersListModel getAllOrdersListModelFromJson(String str) => GetAllOrdersListModel.fromJson(json.decode(str));

String getAllOrdersListModelToJson(GetAllOrdersListModel data) => json.encode(data.toJson());

class GetAllOrdersListModel {
  final int status;
  final String message;
  final OrderListData data;

  GetAllOrdersListModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetAllOrdersListModel.fromJson(Map<String, dynamic> json) => GetAllOrdersListModel(
    status: json["status"],
    message: json["message"],
    data: OrderListData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class OrderListData {
  final List<Order> orders;

  OrderListData({
    required this.orders,
  });

  factory OrderListData.fromJson(Map<String, dynamic> json) => OrderListData(
    orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
  };
}

class Order {
  final int orderId;
  final String orderStatus;
  final dynamic image;
  final List<dynamic> category;
  final List<dynamic> itemCount;

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
    category: List<dynamic>.from(json["category"].map((x) => x)),
    itemCount: List<dynamic>.from(json["item_count"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "order_status": orderStatus,
    "image": image,
    "category": List<dynamic>.from(category.map((x) => x)),
    "item_count": List<dynamic>.from(itemCount.map((x) => x)),
  };
}
