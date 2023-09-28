import 'dart:convert';

AddRatingsModel addRatingsModelFromJson(String str) =>
    AddRatingsModel.fromJson(json.decode(str));

String addRatingsModelToJson(AddRatingsModel data) =>
    json.encode(data.toJson());

class AddRatingsModel {
  final String status;
  final String message;
  final AddRatingsData data;

  AddRatingsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddRatingsModel.fromJson(Map<String, dynamic> json) =>
      AddRatingsModel(
        status: json["status"],
        message: json["message"],
        data: AddRatingsData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class AddRatingsData {
  final int userId;
  final int rating;
  final DateTime reviewTimestamp;
  final int reviewId;
  final int productId;
  final String reviewText;

  AddRatingsData({
    required this.userId,
    required this.rating,
    required this.reviewTimestamp,
    required this.reviewId,
    required this.productId,
    required this.reviewText,
  });

  factory AddRatingsData.fromJson(Map<String, dynamic> json) => AddRatingsData(
        userId: json["user_id"],
        rating: json["rating"],
        reviewTimestamp: DateTime.parse(json["review_timestamp"]),
        reviewId: json["review_id"],
        productId: json["product_id"],
        reviewText: json["review_text"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "rating": rating,
        "review_timestamp": reviewTimestamp.toIso8601String(),
        "review_id": reviewId,
        "product_id": productId,
        "review_text": reviewText,
      };
}
