import 'dart:convert';

import '../general_data_model/general_category_data.dart';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  final int status;
  final String message;
  final Data data;

  HomeModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  final List<Category> categories;
  final List<PopularShop> popularShops;
  final List<Product> todaySDeals;
  final dynamic totalCartCount;

  Data({
    required this.categories,
    required this.popularShops,
    required this.todaySDeals,
    required this.totalCartCount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"].map((x) => Category.fromJson(x))),
        popularShops: json["popular shops"] == null
            ? []
            : List<PopularShop>.from(
                json["popular shops"].map((x) => PopularShop.fromJson(x))),
        todaySDeals: json["today's deals"] == null
            ? []
            : List<Product>.from(
                json["today's deals"].map((x) => Product.fromJson(x))),
        totalCartCount: json["total_cart_count"],
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "popular shops":
            List<dynamic>.from(popularShops.map((x) => x.toJson())),
        "today's deals": List<dynamic>.from(todaySDeals.map((x) => x.toJson())),
        "total_cart_count": totalCartCount,
      };
}

class Category {
  final int categoryId;
  final String categoryImage;
  final String categoryName;

  Category({
    required this.categoryId,
    required this.categoryImage,
    required this.categoryName,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryId: json["category_id"],
        categoryImage: json["category_image"],
        categoryName: json["category_name"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_image": categoryImage,
        "category_name": categoryName,
      };
}

class PopularShop {
  final int shopId;
  final String shopName;
  final String shopImage;

  PopularShop({
    required this.shopId,
    required this.shopName,
    required this.shopImage,
  });

  factory PopularShop.fromJson(Map<String, dynamic> json) => PopularShop(
        shopId: json["shop_id"],
        shopName: json["shop_name"],
        shopImage: json["shop_image"],
      );

  Map<String, dynamic> toJson() => {
        "shop_id": shopId,
        "shop_name": shopName,
        "shop_image": shopImage,
      };
}
