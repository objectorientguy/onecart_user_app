// To parse this JSON data, do
//
//     final fetchCheckoutModel = fetchCheckoutModelFromJson(jsonString);

import 'dart:convert';

FetchCheckoutModel fetchCheckoutModelFromJson(String str) =>
    FetchCheckoutModel.fromJson(json.decode(str));

String fetchCheckoutModelToJson(FetchCheckoutModel data) =>
    json.encode(data.toJson());

class FetchCheckoutModel {
  final int? status;
  final String? message;
  final CheckoutData? data;

  FetchCheckoutModel({
    this.status,
    this.message,
    this.data,
  });

  factory FetchCheckoutModel.fromJson(Map<String, dynamic> json) =>
      FetchCheckoutModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : CheckoutData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class CheckoutData {
  final int? cartItemCount;
  final int? cartTotal;
  final int? discountSum;
  final String? couponApplied;
  final double? deliveryCharges;
  final double? totalBill;

  CheckoutData({
    this.cartItemCount,
    this.cartTotal,
    this.discountSum,
    this.couponApplied,
    this.deliveryCharges,
    this.totalBill,
  });

  factory CheckoutData.fromJson(Map<String, dynamic> json) => CheckoutData(
        cartItemCount: json["cart_item_count"],
        cartTotal: json["cart_total"],
        discountSum: json["discount_sum"],
        couponApplied: json["coupon_applied"],
        deliveryCharges: json["delivery_charges"]?.toDouble(),
        totalBill: json["total_bill"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "cart_item_count": cartItemCount,
        "cart_total": cartTotal,
        "discount_sum": discountSum,
        "coupon_applied": couponApplied,
        "delivery_charges": deliveryCharges,
        "total_bill": totalBill,
      };
}
