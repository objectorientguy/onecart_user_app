import 'dart:convert';
GetProductByIdModel getProductByIdModelFromJson(String str) => GetProductByIdModel.fromJson(json.decode(str));
String getProductByIdModelToJson(GetProductByIdModel data) => json.encode(data.toJson());
class GetProductByIdModel {
  final int? status;
  final String? message;
  final List<CategoryProductDatum>? data;
  GetProductByIdModel({
    this.status,
    this.message,
    this.data,
  });
  factory GetProductByIdModel.fromJson(Map<String, dynamic> json) => GetProductByIdModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<CategoryProductDatum>.from(json["data"]!.map((x) => CategoryProductDatum.fromJson(x))),
  );
  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}
class CategoryProductDatum {
  final String? companyName;
  final int? productId;
  final String? brandName;
  final bool? deal;
  final double? price;
  final double? discountedCost;
  final int? categoryId;
  final String? productName;
  final List<String>? image;
  final int? itemCount;
  final int? discount;
  final String? details;
  CategoryProductDatum({
    this.companyName,
    this.productId,
    this.brandName,
    this.deal,
    this.price,
    this.discountedCost,
    this.categoryId,
    this.productName,
    this.image,
    this.itemCount,
    this.discount,
    this.details,
  });
  factory CategoryProductDatum.fromJson(Map<String, dynamic> json) => CategoryProductDatum(
    companyName: json["company_name"],
    productId: json["product_id"],
    brandName: json["brand_name"],
    deal: json["deal"],
    price: json["price"],
    discountedCost: json["discounted_cost"],
    categoryId: json["category_id"],
    productName: json["product_name"],
    image: json["image"] == null ? [] : List<String>.from(json["image"]!.map((x) => x)),
    itemCount: json["item_count"],
    discount: json["discount"],
    details: json["details"],
  );
  Map<String, dynamic> toJson() => {
    "company_name": companyName,
    "product_id": productId,
    "brand_name": brandName,
    "deal": deal,
    "price": price,
    "discounted_cost": discountedCost,
    "category_id": categoryId,
    "product_name": productName,
    "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
    "item_count": itemCount,
    "discount": discount,
    "details": details,
  };
}