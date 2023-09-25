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
  final List<RecommendedProduct> recommendedProducts;
  final int items;

  ProductDetailsData({
    required this.productData,
    required this.feature,
    required this.recommendedProducts,
    required this.items,
  });

  factory ProductDetailsData.fromJson(Map<String, dynamic> json) =>
      ProductDetailsData(
        productData: Product.fromJson(json["product_data"]),
        feature:
            List<Feature>.from(json["feature"].map((x) => Feature.fromJson(x))),
        recommendedProducts: List<RecommendedProduct>.from(
            json["recommended_products"]
                .map((x) => RecommendedProduct.fromJson(x))),
        items: json["items"],
      );

  Map<String, dynamic> toJson() => {
        "product_data": productData.toJson(),
        "feature": List<dynamic>.from(feature.map((x) => x.toJson())),
        "recommended_products":
            List<dynamic>.from(recommendedProducts.map((x) => x.toJson())),
        "items": items,
      };
}

class Feature {
  final List<String> featureImage;
  final int featureId;
  final int shopId;

  Feature({
    required this.featureImage,
    required this.featureId,
    required this.shopId,
  });

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        featureImage: List<String>.from(json["feature_image"].map((x) => x)),
        featureId: json["feature_id"],
        shopId: json["shop_id"],
      );

  Map<String, dynamic> toJson() => {
        "feature_image": List<dynamic>.from(featureImage.map((x) => x)),
        "feature_id": featureId,
        "shop_id": shopId,
      };
}

class RecommendedProduct {
  final int variantId;
  final double variantCost;
  final int count;
  final String brandName;
  final double discountedCost;
  final int discount;
  final String quantity;
  final String description;
  final List<String> image;
  final int ratings;

  RecommendedProduct({
    required this.variantId,
    required this.variantCost,
    required this.count,
    required this.brandName,
    required this.discountedCost,
    required this.discount,
    required this.quantity,
    required this.description,
    required this.image,
    required this.ratings,
  });

  factory RecommendedProduct.fromJson(Map<String, dynamic> json) =>
      RecommendedProduct(
        variantId: json["variant_id"],
        variantCost: json["variant_cost"].toDouble(),
        count: json["count"],
        brandName: json["brand_name"],
        discountedCost: json["discounted_cost"].toDouble(),
        discount: json["discount"],
        quantity: json["quantity"],
        description: json["description"],
        image: List<String>.from(json["image"].map((x) => x)),
        ratings: json["ratings"],
      );

  Map<String, dynamic> toJson() => {
        "variant_id": variantId,
        "variant_cost": variantCost,
        "count": count,
        "brand_name": brandName,
        "discounted_cost": discountedCost,
        "discount": discount,
        "quantity": quantity,
        "description": description,
        "image": List<dynamic>.from(image.map((x) => x)),
        "ratings": ratings,
      };
}
