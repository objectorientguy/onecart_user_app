import 'dart:convert';

ItemDetailsModel itemDetailsModelFromJson(String str) =>
    ItemDetailsModel.fromJson(json.decode(str));

String itemDetailsModelToJson(ItemDetailsModel data) =>
    json.encode(data.toJson());

class ItemDetailsModel {
  final int? status;
  final String? message;
  final ItemDetailsData? data;

  ItemDetailsModel({
    this.status,
    this.message,
    this.data,
  });

  factory ItemDetailsModel.fromJson(Map<String, dynamic> json) =>
      ItemDetailsModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : ItemDetailsData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class ItemDetailsData {
  final String? companyName;
  final int? categoryId;
  final int? brandId;
  final List<String>? image;
  final int? itemCount;
  final int? discount;
  final String? details;
  final String? weight;
  final int? productId;
  final String? productName;
  final bool? deal;
  final double? price;
  final double? discountedCost;
  final String? description;

  ItemDetailsData({
    this.companyName,
    this.categoryId,
    this.brandId,
    this.image,
    this.itemCount,
    this.discount,
    this.details,
    this.weight,
    this.productId,
    this.productName,
    this.deal,
    this.price,
    this.discountedCost,
    this.description,
  });

  factory ItemDetailsData.fromJson(Map<String, dynamic> json) =>
      ItemDetailsData(
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
        productId: json["product_id"],
        productName: json["product_name"],
        deal: json["deal"],
        price: json["price"],
        discountedCost: json["discounted_cost"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "company_name": companyName,
        "category_id": categoryId,
        "brand_id": brandId,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
        "item_count": itemCount,
        "discount": discount,
        "details": details,
        "weight": weight,
        "product_id": productId,
        "product_name": productName,
        "deal": deal,
        "price": price,
        "discounted_cost": discountedCost,
        "description": description,
      };
}
