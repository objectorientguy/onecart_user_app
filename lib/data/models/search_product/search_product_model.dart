import 'dart:convert';

import 'package:onecart_user_app/data/models/home/home_model.dart';

SearchProductModel searchProductModelFromJson(String str) =>
    SearchProductModel.fromJson(json.decode(str));

String searchProductModelToJson(SearchProductModel data) =>
    json.encode(data.toJson());

class SearchProductModel {
  final int? status;
  final String? message;
  final SearchProductData? data;

  SearchProductModel({
    this.status,
    this.message,
    this.data,
  });

  factory SearchProductModel.fromJson(Map<String, dynamic> json) =>
      SearchProductModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : SearchProductData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class SearchProductData {
  final List<Category>? categories;
  final List<Brand>? brands;
  final List<Deal>? searchResults;

  SearchProductData({
    this.categories,
    this.brands,
    this.searchResults,
  });

  factory SearchProductData.fromJson(Map<String, dynamic> json) =>
      SearchProductData(
        categories: json["Categories"] == null
            ? []
            : List<Category>.from(
                json["Categories"]!.map((x) => Category.fromJson(x))),
        brands: json["Brands"] == null
            ? []
            : List<Brand>.from(json["Brands"]!.map((x) => Brand.fromJson(x))),
        searchResults: json["search_results"] == null
            ? []
            : List<Deal>.from(
                json["search_results"]!.map((x) => Deal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "Brands": brands == null
            ? []
            : List<dynamic>.from(brands!.map((x) => x.toJson())),
        "search_results": searchResults == null
            ? []
            : List<dynamic>.from(searchResults!.map((x) => x.toJson())),
      };
}

class Brand {
  final String? brandName;
  final String? brandImage;
  final int? brandId;

  Brand({
    this.brandName,
    this.brandImage,
    this.brandId,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        brandName: json["brand_name"],
        brandImage: json["brand_image"],
        brandId: json["brand_id"],
      );

  Map<String, dynamic> toJson() => {
        "brand_name": brandName,
        "brand_image": brandImage,
        "brand_id": brandId,
      };
}

class Category {
  final String? categoryName;
  final int? categoryId;
  final String? categoryImage;

  Category({
    this.categoryName,
    this.categoryId,
    this.categoryImage,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryName: json["category_name"],
        categoryId: json["category_id"],
        categoryImage: json["category_image"],
      );

  Map<String, dynamic> toJson() => {
        "category_name": categoryName,
        "category_id": categoryId,
        "category_image": categoryImage,
      };
}
