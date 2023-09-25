import 'dart:convert';

DeleteWishlistModel deleteWishlistModelFromJson(String str) =>
    DeleteWishlistModel.fromJson(json.decode(str));

String deleteWishlistModelToJson(DeleteWishlistModel data) =>
    json.encode(data.toJson());

class DeleteWishlistModel {
  final String status;
  final String message;
  final Data data;

  DeleteWishlistModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DeleteWishlistModel.fromJson(Map<String, dynamic> json) =>
      DeleteWishlistModel(
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
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data();

  Map<String, dynamic> toJson() => {};
}
