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

// class ProductData {
//   final int productId;
//   final String productName;
//   final String details;
//   final List<RecommendedProduct> variants;
//
//   ProductData({
//     required this.productId,
//     required this.productName,
//     required this.details,
//     required this.variants,
//   });
//
//   factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
//     productId: json["product_id"],
//     productName: json["product_name"],
//     details: json["details"],
//     variants: List<RecommendedProduct>.from(json["variants"].map((x) => RecommendedProduct.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "product_id": productId,
//     "product_name": productName,
//     "details": details,
//     "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
//   };
// }
//
// class RecommendedProduct {
//   final int variantId;
//   final double variantCost;
//   final int cartItemQuantityCount;
//   final String brandName;
//   final double discountedCost;
//   final int discount;
//   final String quantity;
//   final String description;
//   final List<String> image;
//   final int ratings;
//   final int count;
//
//   RecommendedProduct({
//     required this.variantId,
//     required this.variantCost,
//     required this.cartItemQuantityCount,
//     required this.brandName,
//     required this.discountedCost,
//     required this.discount,
//     required this.quantity,
//     required this.description,
//     required this.image,
//     required this.ratings,
//     required this.count,
//   });
//
//   factory RecommendedProduct.fromJson(Map<String, dynamic> json) => RecommendedProduct(
//     variantId: json["variant_id"],
//     variantCost: json["variant_cost"].toDouble(),
//     cartItemQuantityCount: json["cart_item_quantity_count"],
//     brandName: json["brand_name"],
//     discountedCost: json["discounted_cost"].toDouble(),
//     discount: json["discount"],
//     quantity: json["quantity"],
//     description: json["description"],
//     image: List<String>.from(json["image"].map((x) => x)),
//     ratings: json["ratings"],
//     count: json["count"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "variant_id": variantId,
//     "variant_cost": variantCost,
//     "cart_item_quantity_count": cartItemQuantityCount,
//     "brand_name": brandName,
//     "discounted_cost": discountedCost,
//     "discount": discount,
//     "quantity": quantity,
//     "description": description,
//     "image": List<dynamic>.from(image.map((x) => x)),
//     "ratings": ratings,
//     "count": count,
//   };
// }
