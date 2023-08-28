// To parse this JSON data, do
//
//     final getProductByIdModel = getProductByIdModelFromJson(jsonString);

import 'dart:convert';

GetProductByIdModel getProductByIdModelFromJson(String str) => GetProductByIdModel.fromJson(json.decode(str));

String getProductByIdModelToJson(GetProductByIdModel data) => json.encode(data.toJson());

class GetProductByIdModel {
  final int? status;
  final String? message;
  final CategoryHeader? category;
  final List<CategoryProductDatum>? data;

  GetProductByIdModel({
    this.status,
    this.message,
    this.category,
    this.data,
  });

  factory GetProductByIdModel.fromJson(Map<String, dynamic> json) => GetProductByIdModel(
    status: json["status"],
    message: json["message"],
    category: json["category"] == null ? null : CategoryHeader.fromJson(json["category"]),
    data: json["data"] == null ? [] : List<CategoryProductDatum>.from(json["data"]!.map((x) => CategoryProductDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "category": category?.toJson(),
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
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

class CategoryProductDatum {
  final String? companyName;
  final int? categoryId;
  final int? brandId;
  final List<String>? image;
  final int? itemCount;
  final int? discount;
  final String? details;
  final int? productId;
  final String? productName;
  final bool? deal;
  final double? price;
  final double? discountedCost;

  CategoryProductDatum({
    this.companyName,
    this.categoryId,
    this.brandId,
    this.image,
    this.itemCount,
    this.discount,
    this.details,
    this.productId,
    this.productName,
    this.deal,
    this.price,
    this.discountedCost,
  });

  factory CategoryProductDatum.fromJson(Map<String, dynamic> json) => CategoryProductDatum(
    companyName: json["company_name"],
    categoryId: json["category_id"],
    brandId: json["brand_id"],
    image: json["image"] == null ? [] : List<String>.from(json["image"]!.map((x) => x)),
    itemCount: json["item_count"],
    discount: json["discount"],
    details: json["details"],
    productId: json["product_id"],
    productName: json["product_name"],
    deal: json["deal"],
    price: json["price"],
    discountedCost: json["discounted_cost"],
  );

  Map<String, dynamic> toJson() => {
    "company_name": companyName,
    "category_id": categoryId,
    "brand_id": brandId,
    "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
    "item_count": itemCount,
    "discount": discount,
    "details": details,
    "product_id": productId,
    "product_name": productName,
    "deal": deal,
    "price": price,
    "discounted_cost": discountedCost,
  };
}
