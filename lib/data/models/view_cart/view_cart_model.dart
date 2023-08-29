// To parse this JSON data, do
//
//     final viewCartModel = viewCartModelFromJson(jsonString);

import 'dart:convert';

ViewCartModel viewCartModelFromJson(String str) =>
    ViewCartModel.fromJson(json.decode(str));

String viewCartModelToJson(ViewCartModel data) => json.encode(data.toJson());

class ViewCartModel {
  final int? status;
  final String? message;
  final List<Datum>? data;

  ViewCartModel({
    this.status,
    this.message,
    this.data,
  });

  factory ViewCartModel.fromJson(Map<String, dynamic> json) => ViewCartModel(
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
  final int? cartItemId;
  final dynamic product;
  final Variant? variant;

  Datum({
    this.cartItemId,
    this.product,
    this.variant,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        cartItemId: json["cartItemId"],
        product: json["product"],
        variant:
            json["variant"] == null ? null : Variant.fromJson(json["variant"]),
      );

  Map<String, dynamic> toJson() => {
        "cartItemId": cartItemId,
        "product": product,
        "variant": variant?.toJson(),
      };
}

class Variant {
  final String? brandName;
  final int? variantId;
  final double? discountedCost;
  final String? discount;
  final String? weight;
  final String? variantName;
  final double? variantPrice;
  final List<String>? image;
  final int? itemCount;
  final int? productId;

  Variant({
    this.brandName,
    this.variantId,
    this.discountedCost,
    this.discount,
    this.weight,
    this.variantName,
    this.variantPrice,
    this.image,
    this.itemCount,
    this.productId,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        brandName: json["brand_name"],
        variantId: json["variant_id"],
        discountedCost: json["discounted_cost"],
        discount: json["discount"],
        weight: json["weight"],
        variantName: json["variant_name"],
        variantPrice: json["variant_price"],
        image: json["image"] == null
            ? []
            : List<String>.from(json["image"]!.map((x) => x)),
        itemCount: json["item_count"],
        productId: json["product_id"],
      );

  Map<String, dynamic> toJson() => {
        "brand_name": brandName,
        "variant_id": variantId,
        "discounted_cost": discountedCost,
        "discount": discount,
        "weight": weight,
        "variant_name": variantName,
        "variant_price": variantPrice,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
        "item_count": itemCount,
        "product_id": productId,
      };
}
