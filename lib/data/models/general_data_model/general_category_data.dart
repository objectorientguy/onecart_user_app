class Product {
  final int productId;
  final String productName;
  final String details;
  final List<Variant> variants;

  Product({
    required this.productId,
    required this.productName,
    required this.details,
    required this.variants,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"],
        productName: json["product_name"],
        details: json["details"],
        variants: List<Variant>.from(
            json["variants"].map((x) => Variant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "details": details,
        "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
      };
}

class Variant {
  final int variantId;
  final double variantCost;
  final int? count;
  final String brandName;
  final int? cartItemQuantityCount;
  final double discountedCost;
  final int discount;
  final String quantity;
  final String description;
  final List<String> image;
  final int ratings;

  Variant({
    required this.variantId,
    required this.variantCost,
    required this.count,
    required this.brandName,
    required this.cartItemQuantityCount,
    required this.discountedCost,
    required this.discount,
    required this.quantity,
    required this.description,
    required this.image,
    required this.ratings,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        variantId: json["variant_id"],
        variantCost: json["variant_cost"],
        count: json["count"],
        brandName: json["brand_name"],
        cartItemQuantityCount: json["cart_item_quantity_count"],
        discountedCost: json["discounted_cost"],
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
        "cart_item_quantity_count": cartItemQuantityCount,
        "discounted_cost": discountedCost,
        "discount": discount,
        "quantity": quantity,
        "description": description,
        "image": List<dynamic>.from(image.map((x) => x)),
        "ratings": ratings,
      };
}
