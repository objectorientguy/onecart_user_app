
import 'dart:convert';

AuthenticateUserModel authenticateUserFromJson(String str) =>
    AuthenticateUserModel.fromJson(json.decode(str));

String authenticateUserToJson(AuthenticateUserModel data) =>
    json.encode(data.toJson());

class AuthenticateUserModel {
  final int? status;
  final String? message;
  final Data? data;

  AuthenticateUserModel({
    this.status,
    this.message,
    this.data,
  });

  factory AuthenticateUserModel.fromJson(Map<String, dynamic> json) =>
      AuthenticateUserModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  final bool? isNewCustomer;
  final String? customerId;
  final String? customerName;
  final dynamic customerBirthdate;
  final dynamic createdAt;
  final int? customerContact;

  Data({
    this.isNewCustomer,
    this.customerId,
    this.customerName,
    this.customerBirthdate,
    this.createdAt,
    this.customerContact,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    isNewCustomer: json["is_new_customer"],
    customerId: json["customer_id"],
    customerName: json["customer_name"],
    customerBirthdate: json["customer_birthdate"],
    createdAt: json["created_at"],
    customerContact: json["customer_contact"],
  );

  Map<String, dynamic> toJson() => {
    "is_new_customer": isNewCustomer,
    "customer_id": customerId,
    "customer_name": customerName,
    "customer_birthdate": customerBirthdate,
    "created_at": createdAt,
    "customer_contact": customerContact,
  };
}
