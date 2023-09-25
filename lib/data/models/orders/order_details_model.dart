import 'dart:convert';

OrderProductsModel orderProductsModelFromJson(String str) =>
    OrderProductsModel.fromJson(json.decode(str));

String orderProductsModelToJson(OrderProductsModel data) =>
    json.encode(data.toJson());

class OrderProductsModel {
  final int status;
  final String message;
  final Data data;

  OrderProductsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory OrderProductsModel.fromJson(Map<String, dynamic> json) =>
      OrderProductsModel(
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
  final OrderTrackingData trackingData;
  final OrderedProducts order;
  final List<Product> productsList;

  Data({
    required this.trackingData,
    required this.order,
    required this.productsList,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        trackingData: OrderTrackingData.fromJson(json["tracking_data"]),
        order: OrderedProducts.fromJson(json["order"]),
        productsList: List<Product>.from(
            json["products_list"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tracking_data": trackingData.toJson(),
        "order": order.toJson(),
        "products_list":
            List<dynamic>.from(productsList.map((x) => x.toJson())),
      };
}

class OrderedProducts {
  final int orderId;
  final int userContact;
  final dynamic addressId;
  final String imageStatus;
  final DateTime orderDate;
  final double orderAmount;
  final String invoiceNumber;
  final List<Product> products;
  final int cartId;
  final String userName;
  final String orderStatus;
  final String orderNumber;
  final double productTotal;
  final double deliveryFees;
  final double invoiceAmount;

  OrderedProducts({
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

  factory OrderedProducts.fromJson(Map<String, dynamic> json) =>
      OrderedProducts(
        orderId: json["order_id"],
        userContact: json["user_contact"],
        addressId: json["address_id"],
        imageStatus: json["image_status"],
        orderDate: DateTime.parse(json["order_date"]),
        orderAmount: json["order_amount"],
        invoiceNumber: json["invoice_number"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
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
        "order_date":
            "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
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

class Product {
  final int productId;
  final String productName;
  final String details;
  final Variants variants;

  Product({
    required this.productId,
    required this.productName,
    required this.details,
    required this.variants,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"],
        productName: json["product_name"],
        details: json["details"],
        variants: Variants.fromJson(json["variants"]),
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "details": details,
        "variants": variants.toJson(),
      };
}

class Variants {
  final int variantId;
  final double variantCost;
  final int count;
  final String brandName;
  final double discountedCost;
  final int discount;
  final String quantity;
  final String description;
  final List<String> image;
  final int ratings;

  Variants({
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

  factory Variants.fromJson(Map<String, dynamic> json) => Variants(
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

class OrderTrackingData {
  final DateTime ordered;
  final int trackId;
  final int bookingId;
  final DateTime underProcess;
  final DateTime shipped;
  final DateTime delivered;

  OrderTrackingData({
    required this.ordered,
    required this.trackId,
    required this.bookingId,
    required this.underProcess,
    required this.shipped,
    required this.delivered,
  });

  factory OrderTrackingData.fromJson(Map<String, dynamic> json) =>
      OrderTrackingData(
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
