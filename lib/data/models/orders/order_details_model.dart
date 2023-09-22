// To parse this JSON data, do
//
//     final orderDetailsModel = orderDetailsModelFromJson(jsonString);

import 'dart:convert';

OrderDetailsModel orderDetailsModelFromJson(String str) => OrderDetailsModel.fromJson(json.decode(str));

String orderDetailsModelToJson(OrderDetailsModel data) => json.encode(data.toJson());

class OrderDetailsModel {
  final int status;
  final String message;
  final Data data;

  OrderDetailsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) => OrderDetailsModel(
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
  final TrackingData trackingData;
  final Order order;
  final List<String> products;

  Data({
    required this.trackingData,
    required this.order,
    required this.products,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    trackingData: TrackingData.fromJson(json["tracking_data"]),
    order: Order.fromJson(json["order"]),
    products: List<String>.from(json["products"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "tracking_data": trackingData.toJson(),
    "order": order.toJson(),
    "products": List<dynamic>.from(products.map((x) => x)),
  };
}

class Order {
  final int orderId;
  final int userContact;
  final String userName;
  final dynamic imageStatus;
  final DateTime orderDate;
  final int orderAmount;
  final String invoiceNumber;
  final List<String> products;
  final int cartId;
  final dynamic addressId;
  final String orderStatus;
  final String orderNumber;
  final int productTotal;
  final int deliveryFees;
  final int invoiceAmount;

  Order({
    required this.orderId,
    required this.userContact,
    required this.userName,
    required this.imageStatus,
    required this.orderDate,
    required this.orderAmount,
    required this.invoiceNumber,
    required this.products,
    required this.cartId,
    required this.addressId,
    required this.orderStatus,
    required this.orderNumber,
    required this.productTotal,
    required this.deliveryFees,
    required this.invoiceAmount,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    orderId: json["order_id"],
    userContact: json["user_contact"],
    userName: json["user_name"],
    imageStatus: json["image_status"],
    orderDate: DateTime.parse(json["order_date"]),
    orderAmount: json["order_amount"],
    invoiceNumber: json["invoice_number"],
    products: List<String>.from(json["products"].map((x) => x)),
    cartId: json["cart_id"],
    addressId: json["address_id"],
    orderStatus: json["order_status"],
    orderNumber: json["order_number"],
    productTotal: json["product_total"],
    deliveryFees: json["delivery_fees"],
    invoiceAmount: json["invoice_amount"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "user_contact": userContact,
    "user_name": userName,
    "image_status": imageStatus,
    "order_date": "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
    "order_amount": orderAmount,
    "invoice_number": invoiceNumber,
    "products": List<dynamic>.from(products.map((x) => x)),
    "cart_id": cartId,
    "address_id": addressId,
    "order_status": orderStatus,
    "order_number": orderNumber,
    "product_total": productTotal,
    "delivery_fees": deliveryFees,
    "invoice_amount": invoiceAmount,
  };
}

class TrackingData {
  final DateTime underProcess;
  final DateTime ordered;
  final DateTime shipped;
  final int bookingId;
  final int trackId;
  final DateTime delivered;

  TrackingData({
    required this.underProcess,
    required this.ordered,
    required this.shipped,
    required this.bookingId,
    required this.trackId,
    required this.delivered,
  });

  factory TrackingData.fromJson(Map<String, dynamic> json) => TrackingData(
    underProcess: DateTime.parse(json["under_process"]),
    ordered: DateTime.parse(json["ordered"]),
    shipped: DateTime.parse(json["shipped"]),
    bookingId: json["booking_id"],
    trackId: json["track_id"],
    delivered: DateTime.parse(json["delivered"]),
  );

  Map<String, dynamic> toJson() => {
    "under_process": underProcess.toIso8601String(),
    "ordered": ordered.toIso8601String(),
    "shipped": shipped.toIso8601String(),
    "booking_id": bookingId,
    "track_id": trackId,
    "delivered": delivered.toIso8601String(),
  };
}
