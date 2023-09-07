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
  final bool? isActive;
  final int? bannerId;
  final String? bannerImage;
  final String? discount;
  final String? tAc;

  PromotinalBanner({
    this.description,
    this.isActive,
    this.bannerId,
    this.bannerImage,
    this.discount,
    this.tAc,
  });

  factory PromotinalBanner.fromJson(Map<String, dynamic> json) =>
      PromotinalBanner(
        description: json["description"],
        isActive: json["isActive"],
        bannerId: json["banner_id"],
        bannerImage: json["banner_image"],
        discount: json["discount"],
        tAc: json["tAc"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "isActive": isActive,
        "banner_id": bannerId,
        "banner_image": bannerImage,
        "discount": discount,
        "tAc": tAc,
      };
}

class Category {
  final String? categoryImage;
  final String? categoryName;
  final int? categoryId;

  Category({
    this.categoryImage,
    this.categoryName,
    this.categoryId,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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

class Deal {
  final int? productId;
  final String? productName;
  final bool? deal;
  final double? price;
  final double? discountedCost;
  final String? description;
  final String? companyName;
  final int? categoryId;
  final int? brandId;
  final List<String>? image;
  final int? itemCount;
  final int? discount;
  final String? details;
  final String? weight;

  Deal({
    this.productId,
    this.productName,
    this.deal,
    this.price,
    this.discountedCost,
    this.description,
    this.companyName,
    this.categoryId,
    this.brandId,
    this.image,
    this.itemCount,
    this.discount,
    this.details,
    this.weight,
  });

  factory Deal.fromJson(Map<String, dynamic> json) => Deal(
        productId: json["product_id"],
        productName: json["product_name"],
        deal: json["deal"],
        price: json["price"],
        discountedCost: json["discounted_cost"],
        description: json["description"],
        companyName: json["company_name"],
        categoryId: json["category_id"],
        brandId: json["brand_id"],
        image: json["image"] == null
            ? []
            : List<String>.from(json["image"]!.map((x) => x)),
        itemCount: json["item_count"],
        discount: json["discount"],
        details: json["details"],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "deal": deal,
        "price": price,
        "discounted_cost": discountedCost,
        "description": description,
        "company_name": companyName,
        "category_id": categoryId,
        "brand_id": brandId,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
        "item_count": itemCount,
        "discount": discount,
        "details": details,
        "weight": weight,
      };
}
