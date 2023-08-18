
import 'dart:convert';

ItemDetailsModel itemDetailsModelFromJson(String str) => ItemDetailsModel.fromJson(json.decode(str));

String itemDetailsModelToJson(ItemDetailsModel data) => json.encode(data.toJson());

class ItemDetailsModel {
  final int? status;
  final String? message;
  final ItemDetailsData? data;

  ItemDetailsModel({
    this.status,
    this.message,
    this.data,
  });

  factory ItemDetailsModel.fromJson(Map<String, dynamic> json) => ItemDetailsModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : ItemDetailsData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class ItemDetailsData {
  final int? categoryId;
  final String? productName;
  final bool? deal;
  final String? cost;
  final String? details;
  final String? companyName;
  final int? productId;
  final List<String>? image;
  final int? itemCount;
  final String? discountedCost;

  ItemDetailsData({
    this.categoryId,
    this.productName,
    this.deal,
    this.cost,
    this.details,
    this.companyName,
    this.productId,
    this.image,
    this.itemCount,
    this.discountedCost,
  });

  factory ItemDetailsData.fromJson(Map<String, dynamic> json) => ItemDetailsData(
    categoryId: json["category_id"],
    productName: json["product_name"],
    deal: json["deal"],
    cost: json["cost"],
    details: json["details"],
    companyName: json["company_name"],
    productId: json["product_id"],
    image: json["image"] == null ? [] : List<String>.from(json["image"]!.map((x) => x)),
    itemCount: json["item_count"],
    discountedCost: json["discounted_cost"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "product_name": productName,
    "deal": deal,
    "cost": cost,
    "details": details,
    "company_name": companyName,
    "product_id": productId,
    "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
    "item_count": itemCount,
    "discounted_cost": discountedCost,
  };
}
