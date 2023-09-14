// To parse this JSON data, do
//
//     final getProductByIdModel = getProductByIdModelFromJson(jsonString);

import 'dart:convert';

import '../general_data_model/general_category_data.dart';

GetProductByIdModel getProductByIdModelFromJson(String str) => GetProductByIdModel.fromJson(json.decode(str));

String getProductByIdModelToJson(GetProductByIdModel data) => json.encode(data.toJson());

class GetProductByIdModel {
  final int status;
  final String message;
  final List<Product> products;

  GetProductByIdModel({
    required this.status,
    required this.message,
    required this.products,
  });

  factory GetProductByIdModel.fromJson(Map<String, dynamic> json) => GetProductByIdModel(
    status: json["status"],
    message: json["message"],
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}


