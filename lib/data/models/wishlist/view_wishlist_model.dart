import 'dart:convert';

WishlistAllModel wishlistAllModelFromJson(String str) => WishlistAllModel.fromJson(json.decode(str));

String wishlistAllModelToJson(WishlistAllModel data) => json.encode(data.toJson());

class WishlistAllModel {
  final int status;
  final String message;
  final WishlistDatum data;

  WishlistAllModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory WishlistAllModel.fromJson(Map<String, dynamic> json) => WishlistAllModel(
    status: json["status"],
    message: json["message"],
    data: WishlistDatum.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class WishlistDatum {
  final List<All> all;
  final List<All> snacks;
  final List<All> stationaries;
  final List<All> dairyBakery;

  WishlistDatum({
    required this.all,
    required this.snacks,
    required this.stationaries,
    required this.dairyBakery,
  });

  factory WishlistDatum.fromJson(Map<String, dynamic> json) => WishlistDatum(
    all: List<All>.from(json["All"].map((x) => All.fromJson(x))),
    snacks: List<All>.from(json["Snacks"].map((x) => All.fromJson(x))),
    stationaries: List<All>.from(json["Stationaries"].map((x) => All.fromJson(x))),
    dairyBakery: List<All>.from(json["Dairy & Bakery"].map((x) => All.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "All": List<dynamic>.from(all.map((x) => x.toJson())),
    "Snacks": List<dynamic>.from(snacks.map((x) => x.toJson())),
    "Stationaries": List<dynamic>.from(stationaries.map((x) => x.toJson())),
    "Dairy & Bakery": List<dynamic>.from(dairyBakery.map((x) => x.toJson())),
  };
}

class All {
  final int favItemId;
  final int productId;
  final String productName;
  final List<String> image;
  final double variantCost;
  final double discountedCost;
  final int discount;
  final String quantity;
  final int variantId;

  All({
    required this.favItemId,
    required this.productId,
    required this.productName,
    required this.image,
    required this.variantCost,
    required this.discountedCost,
    required this.discount,
    required this.quantity,
    required this.variantId,
  });

  factory All.fromJson(Map<String, dynamic> json) => All(
    favItemId: json["fav_item_id"],
    productId: json["product_id"],
    productName: json["product_name"],
    image: List<String>.from(json["image"].map((x) => x)),
    variantCost: json["variant_cost"],
    discountedCost: json["discounted_cost"],
    discount: json["discount"],
    quantity: json["quantity"],
    variantId: json["variant_id"],
  );

  Map<String, dynamic> toJson() => {
    "fav_item_id": favItemId,
    "product_id": productId,
    "product_name": productName,
    "image": List<dynamic>.from(image.map((x) => x)),
    "variant_cost": variantCost,
    "discounted_cost": discountedCost,
    "discount": discount,
    "quantity": quantity,
    "variant_id": variantId,
  };
}
