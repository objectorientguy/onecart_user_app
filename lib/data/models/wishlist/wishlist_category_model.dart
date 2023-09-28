import 'dart:convert';

WishlistCategoryModel wishlistCategoryModelFromJson(String str) => WishlistCategoryModel.fromJson(json.decode(str));

String wishlistCategoryModelToJson(WishlistCategoryModel data) => json.encode(data.toJson());

class WishlistCategoryModel {
  final int status;
  final String message;
  final List<WishlistCategoryDatum> data;

  WishlistCategoryModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory WishlistCategoryModel.fromJson(Map<String, dynamic> json) => WishlistCategoryModel(
    status: json["status"],
    message: json["message"],
    data: List<WishlistCategoryDatum>.from(json["data"].map((x) => WishlistCategoryDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class WishlistCategoryDatum {
  final int categoryId;
  final String categoryName;

  WishlistCategoryDatum({
    required this.categoryId,
    required this.categoryName,
  });

  factory WishlistCategoryDatum.fromJson(Map<String, dynamic> json) => WishlistCategoryDatum(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
  };
}
