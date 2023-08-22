// To parse this JSON data, do
//
//     final getAllCategoriesListModel = getAllCategoriesListModelFromJson(jsonString);

import 'dart:convert';

GetAllCategoriesListModel getAllCategoriesListModelFromJson(String str) =>
    GetAllCategoriesListModel.fromJson(json.decode(str));

String getAllCategoriesListModelToJson(GetAllCategoriesListModel data) =>
    json.encode(data.toJson());

class GetAllCategoriesListModel {
  final int? status;
  final String? message;
  final List<Datum>? data;

  GetAllCategoriesListModel({
    this.status,
    this.message,
    this.data,
  });

  factory GetAllCategoriesListModel.fromJson(Map<String, dynamic> json) =>
      GetAllCategoriesListModel(
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
  final String? categoryImage;
  final String? categoryName;
  final int? categoryId;

  Datum({
    this.categoryImage,
    this.categoryName,
    this.categoryId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        categoryImage: json["category_image"],
        categoryName: json["category_name"],
        categoryId: json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "category_image": categoryImage,
        "category_name": categoryName,
        "category_id": categoryId,
      };
}
