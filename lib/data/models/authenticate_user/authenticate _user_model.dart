import 'dart:convert';

AuthenticateUserModel authenticateUserModelFromJson(String str) => AuthenticateUserModel.fromJson(json.decode(str));

String authenticateUserModelToJson(AuthenticateUserModel data) => json.encode(data.toJson());

class AuthenticateUserModel {
  final int status;
  final String message;
  final Data data;

  AuthenticateUserModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AuthenticateUserModel.fromJson(Map<String, dynamic> json) => AuthenticateUserModel(
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
  final String customerName;
  final DateTime createdAt;
  final String customerId;
  final dynamic customerBirthdate;
  final int customerContact;

  Data({
    required this.customerName,
    required this.createdAt,
    required this.customerId,
    this.customerBirthdate,
    required this.customerContact,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    customerName: json["customer_name"],
    createdAt: DateTime.parse(json["created_at"]),
    customerId: json["customer_id"],
    customerBirthdate: json["customer_birthdate"],
    customerContact: json["customer_contact"],
  );

  Map<String, dynamic> toJson() => {
    "customer_name": customerName,
    "created_at": createdAt.toIso8601String(),
    "customer_id": customerId,
    "customer_birthdate": customerBirthdate,
    "customer_contact": customerContact,
  };
}
