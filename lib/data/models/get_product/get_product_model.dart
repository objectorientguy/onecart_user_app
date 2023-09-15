// To parse this JSON data, do
//
//     final getProductByIdModel = getProductByIdModelFromJson(jsonString);

import 'dart:convert';

import '../home/home_model.dart';

GetProductByIdModel getProductByIdModelFromJson(String str) =>
    GetProductByIdModel.fromJson(json.decode(str));

String getProductByIdModelToJson(GetProductByIdModel data) =>
    json.encode(data.toJson());

class GetProductByIdModel {
  final int? status;
  final String? message;
  final CategoryHeader? category;
  final List<Product>? data;

  GetProductByIdModel({
    this.status,
    this.message,
    this.category,
    this.data,
  });

  factory GetProductByIdModel.fromJson(Map<String, dynamic> json) =>
      GetProductByIdModel(
        status: json["status"],
        message: json["message"],
        category: json["category"] == null
            ? null
            : CategoryHeader.fromJson(json["category"]),
        data: json["data"] == null
            ? []
            : List<Product>.from(
                json["data"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "category": category?.toJson(),
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CategoryHeader {
  final String? categoryImage;
  final int? categoryId;
  final String? categoryName;

  CategoryHeader({
    this.categoryImage,
    this.categoryId,
    this.categoryName,
  });

  factory CategoryHeader.fromJson(Map<String, dynamic> json) => CategoryHeader(
        categoryImage: json["category_image"],
        categoryId: json["category_id"],
        categoryName: json["category_name"],
      );

  Map<String, dynamic> toJson() => {
        "category_image": categoryImage,
        "category_id": categoryId,
        "category_name": categoryName,
      };
}
