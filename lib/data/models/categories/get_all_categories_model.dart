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
  final List<CategoryDatum> data;

  GetAllCategoriesListModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetAllCategoriesListModel.fromJson(Map<String, dynamic> json) =>
      GetAllCategoriesListModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<CategoryDatum>.from(
                json["data"]!.map((x) => CategoryDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CategoryDatum {
  final String? categoryName;
  final String? categoryImage;
  final int? categoryId;

  CategoryDatum({
    this.categoryName,
    this.categoryImage,
    this.categoryId,
  });

  factory CategoryDatum.fromJson(Map<String, dynamic> json) => CategoryDatum(
        categoryName: json["category_name"],
        categoryImage: json["category_image"],
        categoryId: json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "category_name": categoryName,
        "category_image": categoryImage,
        "category_id": categoryId,
      };
}
