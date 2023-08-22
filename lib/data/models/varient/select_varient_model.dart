// To parse this JSON data, do
//
//     final selectVarientListModel = selectVarientListModelFromJson(jsonString);

import 'dart:convert';

SelectVarientListModel selectVarientListModelFromJson(String str) =>
    SelectVarientListModel.fromJson(json.decode(str));

String selectVarientListModelToJson(SelectVarientListModel data) =>
    json.encode(data.toJson());

class SelectVarientListModel {
  final int? status;
  final String? message;
  final List<Datum>? data;

  SelectVarientListModel({
    this.status,
    this.message,
    this.data,
  });

  factory SelectVarientListModel.fromJson(Map<String, dynamic> json) =>
      SelectVarientListModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final String? discount;
  final int? variantId;
  final String? image;
  final int? variantQuantity;
  final double? variantPrice;
  final String? discountedCost;
  final String? weight;
  final int? productId;

  Datum({
    this.discount,
    this.variantId,
    this.image,
    this.variantQuantity,
    this.variantPrice,
    this.discountedCost,
    this.weight,
    this.productId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        discount: json["discount"],
        variantId: json["variant_id"],
        image: json["image"],
        variantQuantity: json["variant_quantity"],
        variantPrice: json["variant_price"],
        discountedCost: json["discounted_cost"],
        weight: json["weight"],
        productId: json["product_id"],
      );

  Map<String, dynamic> toJson() => {
        "discount": discount,
        "variant_id": variantId,
        "image": image,
        "variant_quantity": variantQuantity,
        "variant_price": variantPrice,
        "discounted_cost": discountedCost,
        "weight": weight,
        "product_id": productId,
      };
}
