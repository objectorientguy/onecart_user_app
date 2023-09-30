import 'dart:convert';

ViewCartModel viewCartModelFromJson(String str) =>
    ViewCartModel.fromJson(json.decode(str));

String viewCartModelToJson(ViewCartModel data) => json.encode(data.toJson());

class ViewCartModel {
  final int status;
  final String message;
  final CartDetailsData data;

  ViewCartModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ViewCartModel.fromJson(Map<String, dynamic> json) => ViewCartModel(
        status: json["status"],
        message: json["message"],
        data: CartDetailsData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class CartDetailsData {
  final List<CartItem> cartItems;
  final int cartItemCount;
  final double totalPrice;

  CartDetailsData({
    required this.cartItems,
    required this.cartItemCount,
    required this.totalPrice,
  });

  factory CartDetailsData.fromJson(Map<String, dynamic> json) =>
      CartDetailsData(
        cartItems: List<CartItem>.from(
            json["cart_items"].map((x) => CartItem.fromJson(x))),
        cartItemCount: json["cart_item_count"],
        totalPrice: json["total_price"],
      );

  Map<String, dynamic> toJson() => {
        "cart_items": List<dynamic>.from(cartItems.map((x) => x.toJson())),
        "cart_item_count": cartItemCount,
        "total_price": totalPrice,
      };
}

class CartItem {
  final int cartItemId;
  final Product product;
  final Variant variant;
  final int totalItemCountVariant;

  CartItem({
    required this.cartItemId,
    required this.product,
    required this.variant,
    required this.totalItemCountVariant,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        cartItemId: json["cartItemId"],
        product: Product.fromJson(json["product"]),
        variant: Variant.fromJson(json["variant"]),
        totalItemCountVariant: json["total_item_count_variant"],
      );

  Map<String, dynamic> toJson() => {
        "cartItemId": cartItemId,
        "product": product.toJson(),
        "variant": variant.toJson(),
        "total_item_count_variant": totalItemCountVariant,
      };
}

class Product {
  final int brandId;
  final int productId;
  final String details;
  final String productName;

  Product({
    required this.brandId,
    required this.productId,
    required this.details,
    required this.productName,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        brandId: json["brand_id"],
        productId: json["product_id"],
        details: json["details"],
        productName: json["product_name"],
      );

  Map<String, dynamic> toJson() => {
        "brand_id": brandId,
        "product_id": productId,
        "details": details,
        "product_name": productName,
      };
}

class Variant {
  final String brandName;
  final int count;
  final int discount;
  final String description;
  final int ratings;
  final double variantCost;
  final int variantId;
  final double discountedCost;
  final String quantity;
  final List<String> image;
  final int productId;

  Variant({
    required this.brandName,
    required this.count,
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
        brandName: json["brand_name"],
        count: json["count"],
        discount: json["discount"],
        description: json["description"],
        ratings: json["ratings"],
        variantCost: json["variant_cost"],
        variantId: json["variant_id"],
        discountedCost: json["discounted_cost"],
        quantity: json["quantity"],
        image: List<String>.from(json["image"].map((x) => x)),
        productId: json["product_id"],
      );

  Map<String, dynamic> toJson() => {
        "brand_name": brandName,
        "count": count,
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
