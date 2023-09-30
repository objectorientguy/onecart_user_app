import 'dart:convert';

import '../general_data_model/general_category_data.dart';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  final int status;
  final String message;
  final Data data;

  HomeModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  final List<Category> categories;
  final List<PopularShop> popularShops;
  final List<Product> todaySDeals;
  final int cartItemCount;

  Data({
    required this.categories,
    required this.popularShops,
    required this.todaySDeals,
    required this.cartItemCount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        popularShops: List<PopularShop>.from(
            json["popular shops"].map((x) => PopularShop.fromJson(x))),
        todaySDeals: List<Product>.from(
            json["today's deals"].map((x) => Product.fromJson(x))),
        cartItemCount: json["cart_item_count"],
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "popular shops":
            List<dynamic>.from(popularShops.map((x) => x.toJson())),
        "today's deals": List<dynamic>.from(todaySDeals.map((x) => x.toJson())),
        "cart_item_count": cartItemCount,
      };
}

class Category {
  final int categoryId;
  final String categoryImage;
  final String categoryName;

  Category({
    required this.categoryId,
    required this.categoryImage,
    required this.categoryName,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryId: json["category_id"],
        categoryImage: json["category_image"],
        categoryName: json["category_name"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_image": categoryImage,
        "category_name": categoryName,
      };
}

class PopularShop {
  final int shopId;
  final String shopName;
  final String shopImage;

  PopularShop({
    required this.shopId,
    required this.shopName,
    required this.shopImage,
  });

  factory PopularShop.fromJson(Map<String, dynamic> json) => PopularShop(
        shopId: json["shop_id"],
        shopName: json["shop_name"],
        shopImage: json["shop_image"],
      );

  Map<String, dynamic> toJson() => {
        "shop_id": shopId,
        "shop_name": shopName,
        "shop_image": shopImage,
      };
}

// class TodaySDeal {
//   final int productId;
//   final String productName;
//   final String details;
//   final List<Variant> variants;
//
//   TodaySDeal({
//     required this.productId,
//     required this.productName,
//     required this.details,
//     required this.variants,
//   });
//
//   factory TodaySDeal.fromJson(Map<String, dynamic> json) => TodaySDeal(
//     productId: json["product_id"],
//     productName: json["product_name"],
//     details: json["details"],
//     variants: List<Variant>.from(json["variants"].map((x) => Variant.fromJson(x))),
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
// class Variant {
//   final int variantId;
//   final int variantCost;
//   final int count;
//   final String brandName;
//   final int cartItemQuantityCount;
//   final int discountedCost;
//   final int discount;
//   final String quantity;
//   final String description;
//   final List<String> image;
//   final int ratings;
//
//   Variant({
//     required this.variantId,
//     required this.variantCost,
//     required this.count,
//     required this.brandName,
//     required this.cartItemQuantityCount,
//     required this.discountedCost,
//     required this.discount,
//     required this.quantity,
//     required this.description,
//     required this.image,
//     required this.ratings,
//   });
//
//   factory Variant.fromJson(Map<String, dynamic> json) => Variant(
//     variantId: json["variant_id"],
//     variantCost: json["variant_cost"],
//     count: json["count"],
//     brandName: json["brand_name"],
//     cartItemQuantityCount: json["cart_item_quantity_count"],
//     discountedCost: json["discounted_cost"],
//     discount: json["discount"],
//     quantity: json["quantity"],
//     description: json["description"],
//     image: List<String>.from(json["image"].map((x) => x)),
//     ratings: json["ratings"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "variant_id": variantId,
//     "variant_cost": variantCost,
//     "count": count,
//     "brand_name": brandName,
//     "cart_item_quantity_count": cartItemQuantityCount,
//     "discounted_cost": discountedCost,
//     "discount": discount,
//     "quantity": quantity,
//     "description": description,
//     "image": List<dynamic>.from(image.map((x) => x)),
//     "ratings": ratings,
//   };
// }
