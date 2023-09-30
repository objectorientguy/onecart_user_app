import 'dart:convert';

import '../general_data_model/general_category_data.dart';

ProductDetailsModel productDetailsModelFromJson(String str) =>
    ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) =>
    json.encode(data.toJson());

class ProductDetailsModel {
  final int status;
  final String message;
  final ProductDetailsData data;

  ProductDetailsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        status: json["status"],
        message: json["message"],
        data: ProductDetailsData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class ProductDetailsData {
  final Product productData;
  final List<Feature> feature;
  final List<Variant> recommendedProducts;
  final int cartItemCount;

  ProductDetailsData({
    required this.productData,
    required this.feature,
    required this.recommendedProducts,
    required this.cartItemCount,
  });

  factory ProductDetailsData.fromJson(Map<String, dynamic> json) =>
      ProductDetailsData(
        productData: Product.fromJson(json["product_data"]),
        feature:
            List<Feature>.from(json["feature"].map((x) => Feature.fromJson(x))),
        recommendedProducts: List<Variant>.from(
            json["recommended_products"].map((x) => Variant.fromJson(x))),
        cartItemCount: json["cart_item_count"],
      );

  Map<String, dynamic> toJson() => {
        "product_data": productData.toJson(),
        "feature": List<dynamic>.from(feature.map((x) => x.toJson())),
        "recommended_products":
            List<dynamic>.from(recommendedProducts.map((x) => x.toJson())),
        "cart_item_count": cartItemCount,
      };
}

class Feature {
  final int shopId;
  final int featureId;
  final List<String> featureImage;

  Feature({
    required this.shopId,
    required this.featureId,
    required this.featureImage,
  });

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        shopId: json["shop_id"],
        featureId: json["feature_id"],
        featureImage: List<String>.from(json["feature_image"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "shop_id": shopId,
        "feature_id": featureId,
        "feature_image": List<dynamic>.from(featureImage.map((x) => x)),
      };
}
