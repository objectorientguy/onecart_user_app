// To parse this JSON data, do
//
//     final getProductByIdModel = getProductByIdModelFromJson(jsonString);

import 'dart:convert';

GetProductByIdModel getProductByIdModelFromJson(String str) =>
    GetProductByIdModel.fromJson(json.decode(str));

String getProductByIdModelToJson(GetProductByIdModel data) =>
    json.encode(data.toJson());

class GetProductByIdModel {
  final int? status;
  final String? message;
  final List<CategoryProductDatum>? data;

  GetProductByIdModel({
    this.status,
    this.message,
    this.data,
  });

  factory GetProductByIdModel.fromJson(Map<String, dynamic> json) =>
      GetProductByIdModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<CategoryProductDatum>.from(
                json["data"]!.map((x) => CategoryProductDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CategoryProductDatum {
  final String? companyName;
  final int? categoryId;
  final String? productName;
  final List<String>? image;
  final String? cost;
  final String? details;
  final int? companyId;
  final int? productId;
  final int? itemCount;
  final String? discountedCost;

  CategoryProductDatum({
    this.companyName,
    this.categoryId,
    this.productName,
    this.image,
    this.cost,
    this.details,
    this.companyId,
    this.productId,
    this.itemCount,
    this.discountedCost,
  });

  factory CategoryProductDatum.fromJson(Map<String, dynamic> json) =>
      CategoryProductDatum(
        companyName: json["company_name"],
        categoryId: json["category_id"],
        productName: json["product_name"],
        image: json["image"] == null
            ? []
            : List<String>.from(json["image"]!.map((x) => x)),
        cost: json["cost"],
        details: json["details"],
        companyId: json["company_id"],
        productId: json["product_id"],
        itemCount: json["item_count"],
        discountedCost: json["discounted_cost"],
      );

  Map<String, dynamic> toJson() => {
        "company_name": companyName,
        "category_id": categoryId,
        "product_name": productName,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
        "cost": cost,
        "details": details,
        "company_id": companyId,
        "product_id": productId,
        "item_count": itemCount,
        "discounted_cost": discountedCost,
      };
}
