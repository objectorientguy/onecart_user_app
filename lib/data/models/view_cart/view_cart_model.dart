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
  final Product? product;
  final Variant? variant;

  Datum({
    this.cartItemId,
    this.product,
    this.variant,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        cartItemId: json["cartItemId"],
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
        variant:
            json["variant"] == null ? null : Variant.fromJson(json["variant"]),
      );

  Map<String, dynamic> toJson() => {
        "cartItemId": cartItemId,
        "product": product?.toJson(),
        "variant": variant?.toJson(),
      };
}

class Product {
  final int? categoryId;
  final String? productName;
  final List<String>? image;
  final int? itemCount;
  final int? discount;
  final String? details;
  final String? companyName;
  final int? productId;
  final String? brandName;
  final bool? deal;
  final double? price;
  final double? discountedCost;

  Product({
    this.categoryId,
    this.productName,
    this.image,
    this.itemCount,
    this.discount,
    this.details,
    this.companyName,
    this.productId,
    this.brandName,
    this.deal,
    this.price,
    this.discountedCost,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        categoryId: json["category_id"],
        productName: json["product_name"],
        image: json["image"] == null
            ? []
            : List<String>.from(json["image"]!.map((x) => x)),
        itemCount: json["item_count"],
        discount: json["discount"],
        details: json["details"],
        companyName: json["company_name"],
        productId: json["product_id"],
        brandName: json["brand_name"],
        deal: json["deal"],
        price: json["price"],
        discountedCost: json["discounted_cost"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "product_name": productName,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
        "item_count": itemCount,
        "discount": discount,
        "details": details,
        "company_name": companyName,
        "product_id": productId,
        "brand_name": brandName,
        "deal": deal,
        "price": price,
        "discounted_cost": discountedCost,
      };
}

class Variant {
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

  Variant({
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

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        variantName: json["variant_name"],
        variantId: json["variant_id"],
        discountedCost: json["discounted_cost"],
        discount: json["discount"],
        weight: json["weight"],
        image: json["image"] == null
            ? []
            : List<String>.from(json["image"]!.map((x) => x)),
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
