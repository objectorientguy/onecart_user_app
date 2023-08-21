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
  final List<Banner>? banners;
  final List<Deal>? deals;

  Data({
    this.categories,
    this.banners,
    this.deals,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
    banners: json["banners"] == null ? [] : List<Banner>.from(json["banners"]!.map((x) => Banner.fromJson(x))),
    deals: json["deals"] == null ? [] : List<Deal>.from(json["deals"]!.map((x) => Deal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
    "banners": banners == null ? [] : List<dynamic>.from(banners!.map((x) => x.toJson())),
    "deals": deals == null ? [] : List<dynamic>.from(deals!.map((x) => x.toJson())),
  };
}

class Banner {
  final String? discount;
  final dynamic description;
  final String? tAc;
  final bool? isActive;
  final int? bannerId;
  final String? bannerImage;

  Banner({
    this.discount,
    this.description,
    this.tAc,
    this.isActive,
    this.bannerId,
    this.bannerImage,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    discount: json["discount"],
    description: json["description"],
    tAc: json["tAc"],
    isActive: json["isActive"],
    bannerId: json["banner_id"],
    bannerImage: json["banner_image"],
  );

  Map<String, dynamic> toJson() => {
    "discount": discount,
    "description": description,
    "tAc": tAc,
    "isActive": isActive,
    "banner_id": bannerId,
    "banner_image": bannerImage,
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
  final String? companyName;
  final int? categoryId;
  final String? productName;
  final String? brandName;
  final bool? deal;
  final String? cost;
  final String? details;
  final int? productId;
  final String? image;
  final int? itemCount;
  final String? discountedCost;

  Deal({
    this.companyName,
    this.categoryId,
    this.productName,
    this.brandName,
    this.deal,
    this.cost,
    this.details,
    this.productId,
    this.image,
    this.itemCount,
    this.discountedCost,
  });

  factory Deal.fromJson(Map<String, dynamic> json) => Deal(
    companyName: json["company_name"],
    categoryId: json["category_id"],
    productName: json["product_name"],
    brandName: json["brand_name"],
    deal: json["deal"],
    cost: json["cost"],
    details: json["details"],
    productId: json["product_id"],
    image: json["image"],
    itemCount: json["item_count"],
    discountedCost: json["discounted_cost"],
  );

  Map<String, dynamic> toJson() => {
    "company_name": companyName,
    "category_id": categoryId,
    "product_name": productName,
    "brand_name": brandName,
    "deal": deal,
    "cost": cost,
    "details": details,
    "product_id": productId,
    "image": image,
    "item_count": itemCount,
    "discounted_cost": discountedCost,
  };
}
