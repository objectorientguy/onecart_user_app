// To parse this JSON data, do

//     final fetchAddressModel = fetchAddressModelFromJson(jsonString);

import 'dart:convert';

FetchAddressModel fetchAddressModelFromJson(String str) => FetchAddressModel.fromJson(json.decode(str));

String fetchAddressModelToJson(FetchAddressModel data) => json.encode(data.toJson());

class FetchAddressModel {
  final int? status;
  final String? message;
  final List<Datum>? data;

  FetchAddressModel({
    this.status,
    this.message,
    this.data,
  });

  factory FetchAddressModel.fromJson(Map<String, dynamic> json) => FetchAddressModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final int? addressId;
  final String? addressName;
  final String? city;
  final int? userContact;
  final int? companyId;
  final String? addressTitle;
  final int? pincode;

  Datum({
    this.addressId,
    this.addressName,
    this.city,
    this.userContact,
    this.companyId,
    this.addressTitle,
    this.pincode,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    addressId: json["address_id"],
    addressName: json["address_name"],
    city: json["city"],
    userContact: json["user_contact"],
    companyId: json["company_id"],
    addressTitle: json["address_title"],
    pincode: json["pincode"],
  );

  Map<String, dynamic> toJson() => {
    "address_id": addressId,
    "address_name": addressName,
    "city": city,
    "user_contact": userContact,
    "company_id": companyId,
    "address_title": addressTitle,
    "pincode": pincode,
  };
}
