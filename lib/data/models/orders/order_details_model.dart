// To parse this JSON data, do
//
//     final getAllOrdersListModel = getAllOrdersListModelFromJson(jsonString);

import 'dart:convert';

GetOrdersDetailsModel getAllOrdersListModelFromJson(String str) => GetOrdersDetailsModel.fromJson(json.decode(str));

String getAllOrdersListModelToJson(GetOrdersDetailsModel data) => json.encode(data.toJson());

class GetOrdersDetailsModel {
  final int status;
  final String message;
  final OrderData data;

  GetOrdersDetailsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetOrdersDetailsModel.fromJson(Map<String, dynamic> json) => GetOrdersDetailsModel(
    status: json["status"],
    message: json["message"],
    data: OrderData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class OrderData {
  final Tracking tracking;
  final Order order;

  OrderData({
    required this.tracking,
    required this.order,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
    tracking: Tracking.fromJson(json["tracking"]),
    order: Order.fromJson(json["order"]),
  );

  Map<String, dynamic> toJson() => {
    "tracking": tracking.toJson(),
    "order": order.toJson(),
  };
}

class Order {
  final DateTime orderDate;
  final String orderNumber;
  final int deliveryFees;
  final int invoiceAmount;
  final int orderId;
  final String userName;
  final int productTotal;
  final int orderAmount;
  final String invoiceNumber;
  final List<String> products;

  Order({
    required this.orderDate,
    required this.orderNumber,
    required this.deliveryFees,
    required this.invoiceAmount,
    required this.orderId,
    required this.userName,
    required this.productTotal,
    required this.orderAmount,
    required this.invoiceNumber,
    required this.products,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    orderDate: DateTime.parse(json["order_date"]),
    orderNumber: json["order_number"],
    deliveryFees: json["delivery_fees"],
    invoiceAmount: json["invoice_amount"],
    orderId: json["order_id"],
    userName: json["user_name"],
    productTotal: json["product_total"],
    orderAmount: json["order_amount"],
    invoiceNumber: json["invoice_number"],
    products:json["products"] == null ? []:List<String>.from(json["products"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "order_date": "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
    "order_number": orderNumber,
    "delivery_fees": deliveryFees,
    "invoice_amount": invoiceAmount,
    "order_id": orderId,
    "user_name": userName,
    "product_total": productTotal,
    "order_amount": orderAmount,
    "invoice_number": invoiceNumber,
    "products": List<dynamic>.from(products.map((x) => x)),
  };
}

class Tracking {
  final DateTime ordered;
  final DateTime underProcess;
  final DateTime shipped;
  final DateTime delivered;

  Tracking({
    required this.ordered,
    required this.underProcess,
    required this.shipped,
    required this.delivered,
  });

  factory Tracking.fromJson(Map<String, dynamic> json) => Tracking(
    ordered: DateTime.parse(json["ordered"]),
    underProcess: DateTime.parse(json["under_process"]),
    shipped: DateTime.parse(json["shipped"]),
    delivered: DateTime.parse(json["delivered"]),
  );

  Map<String, dynamic> toJson() => {
    "ordered": ordered.toIso8601String(),
    "under_process": underProcess.toIso8601String(),
    "shipped": shipped.toIso8601String(),
    "delivered": delivered.toIso8601String(),
  };
}
