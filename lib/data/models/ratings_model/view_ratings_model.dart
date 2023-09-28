import 'dart:convert';

ViewRatingsModel viewRatingsModelFromJson(String str) =>
    ViewRatingsModel.fromJson(json.decode(str));

String viewRatingsModelToJson(ViewRatingsModel data) =>
    json.encode(data.toJson());

class ViewRatingsModel {
  final int status;
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
  final int reviewId;
  final int productId;
  final int userId;
  final int rating;
  final String reviewText;
  final String customerName;
  final dynamic profileImage;

  RatingsData({
    required this.reviewId,
    required this.productId,
    required this.userId,
    required this.rating,
    required this.reviewText,
    required this.customerName,
    required this.profileImage,
  });

  factory RatingsData.fromJson(Map<String, dynamic> json) => RatingsData(
        reviewId: json["review_id"],
        productId: json["product_id"],
        userId: json["user_id"],
        rating: json["rating"],
        reviewText: json["review_text"],
        customerName: json["customer_name"],
        profileImage: json["profile_image"],
      );

  Map<String, dynamic> toJson() => {
        "review_id": reviewId,
        "product_id": productId,
        "user_id": userId,
        "rating": rating,
        "review_text": reviewText,
        "customer_name": customerName,
        "profile_image": profileImage,
      };
}
