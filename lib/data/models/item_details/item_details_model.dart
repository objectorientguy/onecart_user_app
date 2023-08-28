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

  ItemDetailsData({
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

  factory ItemDetailsData.fromJson(Map<String, dynamic> json) =>
      ItemDetailsData(
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
