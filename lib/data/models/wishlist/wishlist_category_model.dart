import 'dart:convert';

WishlistCategoryModel wishlistCategoryModelFromJson(String str) => WishlistCategoryModel.fromJson(json.decode(str));

String wishlistCategoryModelToJson(WishlistCategoryModel data) => json.encode(data.toJson());

class WishlistCategoryModel {
  final int status;
  final String message;
  final List<Datum> data;

  WishlistCategoryModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory WishlistCategoryModel.fromJson(Map<String, dynamic> json) => WishlistCategoryModel(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  final int categoryId;
  final String categoryName;

  Datum({
    required this.categoryId,
    required this.categoryName,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
  };
}
