import 'dart:convert';

DeleteCartItemModel deleteCartItemModelFromJson(String str) =>
    DeleteCartItemModel.fromJson(json.decode(str));

String deleteCartItemModelToJson(DeleteCartItemModel data) =>
    json.encode(data.toJson());

class DeleteCartItemModel {
  final int status;
  final String message;

  DeleteCartItemModel({
    required this.status,
    required this.message,
  });

  factory DeleteCartItemModel.fromJson(Map<String, dynamic> json) =>
      DeleteCartItemModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
