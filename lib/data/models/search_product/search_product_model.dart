import 'dart:convert';

import '../home/home_model.dart';

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

// class SearchResult {
//   final String? companyName;
//   final int? categoryId;
//   final int? brandId;
//   final List<String>? image;
//   final int? itemCount;
//   final int? discount;
//   final String? details;
//   final int? productId;
//   final String? productName;
//   final bool? deal;
//   final double? price;
//   final double? discountedCost;
//
//   SearchResult({
//     this.companyName,
//     this.categoryId,
//     this.brandId,
//     this.image,
//     this.itemCount,
//     this.discount,
//     this.details,
//     this.productId,
//     this.productName,
//     this.deal,
//     this.price,
//     this.discountedCost,
//   });
//
//   factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
//         companyName: json["company_name"],
//         categoryId: json["category_id"],
//         brandId: json["brand_id"],
//         image: json["image"] == null
//             ? []
//             : List<String>.from(json["image"]!.map((x) => x)),
//         itemCount: json["item_count"],
//         discount: json["discount"],
//         details: json["details"],
//         productId: json["product_id"],
//         productName: json["product_name"],
//         deal: json["deal"],
//         price: json["price"],
//         discountedCost: json["discounted_cost"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "company_name": companyName,
//         "category_id": categoryId,
//         "brand_id": brandId,
//         "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
//         "item_count": itemCount,
//         "discount": discount,
//         "details": details,
//         "product_id": productId,
//         "product_name": productName,
//         "deal": deal,
//         "price": price,
//         "discounted_cost": discountedCost,
//       };
// }
