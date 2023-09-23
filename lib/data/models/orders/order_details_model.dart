// To parse this JSON data, do
//
//     final orderDetailsModel = orderDetailsModelFromJson(jsonString);
import 'dart:convert';

OrderDetailsModel orderDetailsModelFromJson(String str) => OrderDetailsModel.fromJson(json.decode(str));

String orderDetailsModelToJson(OrderDetailsModel data) => json.encode(data.toJson());

class OrderDetailsModel {
  final int status;
  final String message;
  final OrderDetailsData data;

  OrderDetailsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) => OrderDetailsModel(
    status: json["status"],
    message: json["message"],
    data: OrderDetailsData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class OrderDetailsData {
  final TrackingData trackingData;
  final OrderDetails order;
  final List<OrderProduct> products;

  OrderDetailsData({
    required this.trackingData,
    required this.order,
    required this.products,
  });

  factory OrderDetailsData.fromJson(Map<String, dynamic> json) => OrderDetailsData(
    trackingData: TrackingData.fromJson(json["tracking_data"]),
    order: OrderDetails.fromJson(json["order"]),
    products: List<OrderProduct>.from(json["products"].map((x) => OrderProduct.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "tracking_data": trackingData.toJson(),
    "order": order.toJson(),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class OrderDetails {
  final int orderId;
  final int userContact;
  final dynamic addressId;
  final dynamic imageStatus;
  final DateTime orderDate;
  final int orderAmount;
  final String invoiceNumber;
  final List<OrderProduct> products;
  final int cartId;
  final String userName;
  final String orderStatus;
  final String orderNumber;
  final int productTotal;
  final int deliveryFees;
  final int invoiceAmount;

  OrderDetails({
    required this.orderId,
    required this.userContact,
    required this.addressId,
    required this.imageStatus,
    required this.orderDate,
    required this.orderAmount,
    required this.invoiceNumber,
    required this.products,
    required this.cartId,
    required this.userName,
    required this.orderStatus,
    required this.orderNumber,
    required this.productTotal,
    required this.deliveryFees,
    required this.invoiceAmount,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
    orderId: json["order_id"],
    userContact: json["user_contact"],
    addressId: json["address_id"],
    imageStatus: json["image_status"],
    orderDate: DateTime.parse(json["order_date"]),
    orderAmount: json["order_amount"],
    invoiceNumber: json["invoice_number"],
    products: List<OrderProduct>.from(json["products"].map((x) => OrderProduct.fromJson(x))),
    cartId: json["cart_id"],
    userName: json["user_name"],
    orderStatus: json["order_status"],
    orderNumber: json["order_number"],
    productTotal: json["product_total"],
    deliveryFees: json["delivery_fees"],
    invoiceAmount: json["invoice_amount"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "user_contact": userContact,
    "address_id": addressId,
    "image_status": imageStatus,
    "order_date": "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
    "order_amount": orderAmount,
    "invoice_number": invoiceNumber,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "cart_id": cartId,
    "user_name": userName,
    "order_status": orderStatus,
    "order_number": orderNumber,
    "product_total": productTotal,
    "delivery_fees": deliveryFees,
    "invoice_amount": invoiceAmount,
  };
}

class OrderProduct {
  final int variantId;
  final int variantCost;
  final int count;
  final String brandName;
  final int discountedCost;
  final int discount;
  final String quantity;
  final String description;
  final List<String> image;
  final int ratings;

  OrderProduct({
    required this.variantId,
    required this.variantCost,
    required this.count,
    required this.brandName,
    required this.discountedCost,
    required this.discount,
    required this.quantity,
    required this.description,
    required this.image,
    required this.ratings,
  });

  factory OrderProduct.fromJson(Map<String, dynamic> json) => OrderProduct(
    variantId: json["variant_id"],
    variantCost: json["variant_cost"],
    count: json["count"],
    brandName: json["brand_name"],
    discountedCost: json["discounted_cost"],
    discount: json["discount"],
    quantity: json["quantity"],
    description: json["description"],
    image: List<String>.from(json["image"].map((x) => x)),
    ratings: json["ratings"],
  );

  Map<String, dynamic> toJson() => {
    "variant_id": variantId,
    "variant_cost": variantCost,
    "count": count,
    "brand_name": brandName,
    "discounted_cost": discountedCost,
    "discount": discount,
    "quantity": quantity,
    "description": description,
    "image": List<dynamic>.from(image.map((x) => x)),
    "ratings": ratings,
  };
}

class TrackingData {
  final DateTime ordered;
  final int trackId;
  final int bookingId;
  final DateTime underProcess;
  final DateTime shipped;
  final DateTime delivered;

  TrackingData({
    required this.ordered,
    required this.trackId,
    required this.bookingId,
    required this.underProcess,
    required this.shipped,
    required this.delivered,
  });

  factory TrackingData.fromJson(Map<String, dynamic> json) => TrackingData(
    ordered: DateTime.parse(json["ordered"]),
    trackId: json["track_id"],
    bookingId: json["booking_id"],
    underProcess: DateTime.parse(json["under_process"]),
    shipped: DateTime.parse(json["shipped"]),
    delivered: DateTime.parse(json["delivered"]),
  );

  Map<String, dynamic> toJson() => {
    "ordered": ordered.toIso8601String(),
    "track_id": trackId,
    "booking_id": bookingId,
    "under_process": underProcess.toIso8601String(),
    "shipped": shipped.toIso8601String(),
    "delivered": delivered.toIso8601String(),
  };
}
