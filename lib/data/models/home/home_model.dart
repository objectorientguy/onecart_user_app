// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  final int? status;
  final String? message;
  final Data? data;

  HomeModel({
    this.status,
    this.message,
    this.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  final List<Category>? categories;
  final List<PromotinalBanner>? banners;
  final List<Deal>? deals;

  Data({
    this.categories,
    this.banners,
    this.deals,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
        banners: json["banners"] == null
            ? []
            : List<PromotinalBanner>.from(
                json["banners"]!.map((x) => PromotinalBanner.fromJson(x))),
        deals: json["deals"] == null
            ? []
            : List<Deal>.from(json["deals"]!.map((x) => Deal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "banners": banners == null
            ? []
            : List<dynamic>.from(banners!.map((x) => x.toJson())),
        "deals": deals == null
            ? []
            : List<dynamic>.from(deals!.map((x) => x.toJson())),
      };
}

class PromotinalBanner {
  final dynamic description;
  final String? discount;
  final String? tAc;
  final String? bannerImage;
  final int? bannerId;
  final bool? isActive;

  PromotinalBanner({
    this.description,
    this.discount,
    this.tAc,
    this.bannerImage,
    this.bannerId,
    this.isActive,
  });

  factory PromotinalBanner.fromJson(Map<String, dynamic> json) =>
      PromotinalBanner(
        description: json["description"],
        discount: json["discount"],
        tAc: json["tAc"],
        bannerImage: json["banner_image"],
        bannerId: json["banner_id"],
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "discount": discount,
        "tAc": tAc,
        "banner_image": bannerImage,
        "banner_id": bannerId,
        "isActive": isActive,
      };
}

class Category {
  final String? categoryName;
  final String? categoryImage;
  final int? categoryId;

  Category({
    this.categoryName,
    this.categoryImage,
    this.categoryId,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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

class Deal {
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

  Deal({
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

  factory Deal.fromJson(Map<String, dynamic> json) => Deal(
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
