import 'dart:convert';

ViewRatingsModel viewRatingsModelFromJson(String str) =>
    ViewRatingsModel.fromJson(json.decode(str));

String viewRatingsModelToJson(ViewRatingsModel data) =>
    json.encode(data.toJson());

class ViewRatingsModel {
  final String status;
  final String message;
  final List<RatingsData> data;

  ViewRatingsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ViewRatingsModel.fromJson(Map<String, dynamic> json) =>
      ViewRatingsModel(
        status: json["status"],
        message: json["message"],
        data: List<RatingsData>.from(
            json["data"].map((x) => RatingsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class RatingsData {
  final int userId;
  final int rating;
  final DateTime reviewTimestamp;
  final int reviewId;
  final int productId;
  final String reviewText;

  RatingsData({
    required this.userId,
    required this.rating,
    required this.reviewTimestamp,
    required this.reviewId,
    required this.productId,
    required this.reviewText,
  });

  factory RatingsData.fromJson(Map<String, dynamic> json) => RatingsData(
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
