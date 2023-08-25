// To parse this JSON data, do
//
//     final selectVarientListModel = selectVarientListModelFromJson(jsonString);

import 'dart:convert';

SelectVarientListModel selectVarientListModelFromJson(String str) => SelectVarientListModel.fromJson(json.decode(str));

String selectVarientListModelToJson(SelectVarientListModel data) => json.encode(data.toJson());

class SelectVarientListModel {
  final int? status;
  final String? message;
  final List<Datum>? data;

  SelectVarientListModel({
    this.status,
    this.message,
    this.data,
  });

  factory SelectVarientListModel.fromJson(Map<String, dynamic> json) => SelectVarientListModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final String? variantName;
  final int? variantId;
  final double? discountedCost;
  final String? discount;
  final String? weight;
  final List<String>? image;
  final double? variantPrice;
  final String? brandName;
  final int? itemCount;
  final int? productId;

  Datum({
    this.variantName,
    this.variantId,
    this.discountedCost,
    this.discount,
    this.weight,
    this.image,
    this.variantPrice,
    this.brandName,
    this.itemCount,
    this.productId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    variantName: json["variant_name"],
    variantId: json["variant_id"],
    discountedCost: json["discounted_cost"],
    discount: json["discount"],
    weight: json["weight"],
    image: json["image"] == null ? [] : List<String>.from(json["image"]!.map((x) => x)),
    variantPrice: json["variant_price"],
    brandName: json["brand_name"],
    itemCount: json["item_count"],
    productId: json["product_id"],
  );

  Map<String, dynamic> toJson() => {
    "variant_name": variantName,
    "variant_id": variantId,
    "discounted_cost": discountedCost,
    "discount": discount,
    "weight": weight,
    "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
    "variant_price": variantPrice,
    "brand_name": brandName,
    "item_count": itemCount,
    "product_id": productId,
  };
}
