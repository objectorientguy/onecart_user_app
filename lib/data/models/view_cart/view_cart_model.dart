import 'dart:convert';

ViewCartModel viewCartModelFromJson(String str) =>
    ViewCartModel.fromJson(json.decode(str));

String viewCartModelToJson(ViewCartModel data) => json.encode(data.toJson());

class ViewCartModel {
  final int status;
  final String message;
  final List<Datum> data;

  ViewCartModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ViewCartModel.fromJson(Map<String, dynamic> json) => ViewCartModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  final int cartItemId;
  final Product product;
  final Variant variant;

  Datum({
    required this.cartItemId,
    required this.product,
    required this.variant,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        cartItemId: json["cartItemId"],
        product: Product.fromJson(json["product"]),
        variant: Variant.fromJson(json["variant"]),
      );

  Map<String, dynamic> toJson() => {
        "cartItemId": cartItemId,
        "product": product.toJson(),
        "variant": variant.toJson(),
      };
}

class Product {
  final int brandId;
  final int productId;
  final String productName;
  final String details;

  Product({
    required this.brandId,
    required this.productId,
    required this.productName,
    required this.details,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        brandId: json["brand_id"],
        productId: json["product_id"],
        productName: json["product_name"],
        details: json["details"],
      );

  Map<String, dynamic> toJson() => {
        "brand_id": brandId,
        "product_id": productId,
        "product_name": productName,
        "details": details,
      };
}

class Variant {
  final int count;
  final String brandName;
  final int discount;
  final String description;
  final int ratings;
  final int variantCost;
  final int variantId;
  final int discountedCost;
  final String quantity;
  final List<String> image;
  final int productId;

  Variant({
    required this.count,
    required this.brandName,
    required this.discount,
    required this.description,
    required this.ratings,
    required this.variantCost,
    required this.variantId,
    required this.discountedCost,
    required this.quantity,
    required this.image,
    required this.productId,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        count: json["count"],
        brandName: json["brand_name"],
        discount: json["discount"],
        description: json["description"],
        ratings: json["ratings"],
        variantCost: json["variant_cost"],
        variantId: json["variant_id"],
        discountedCost: json["discounted_cost"],
        quantity: json["quantity"],
        image: json["image"] == null
            ? []
            : List<String>.from(json["image"].map((x) => x)),
        productId: json["product_id"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "brand_name": brandName,
        "discount": discount,
        "description": description,
        "ratings": ratings,
        "variant_cost": variantCost,
        "variant_id": variantId,
        "discounted_cost": discountedCost,
        "quantity": quantity,
        "image": List<dynamic>.from(image.map((x) => x)),
        "product_id": productId,
      };
}
