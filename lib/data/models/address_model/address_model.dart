// To parse this JSON data, do
//
//     final getAllAddressModel = getAllAddressModelFromJson(jsonString);

import 'dart:convert';

GetAllAddressModel getAllAddressModelFromJson(String str) =>
    GetAllAddressModel.fromJson(json.decode(str));

String getAllAddressModelToJson(GetAllAddressModel data) =>
    json.encode(data.toJson());

class GetAllAddressModel {
  final String? status;
  final String? message;
  final List<AddressDatum>? data;

  GetAllAddressModel({
    this.status,
    this.message,
    this.data,
  });

  factory GetAllAddressModel.fromJson(Map<String, dynamic> json) =>
      GetAllAddressModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<AddressDatum>.from(json["data"]!.map((x) => AddressDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class AddressDatum {
  final String? addressType;
  final int? phoneNo;
  final String? state;
  final int? addressId;
  final int? userContact;
  final String? addressName;
  final String? city;
  final int? pincode;

  AddressDatum({
    this.addressType,
    this.phoneNo,
    this.state,
    this.addressId,
    this.userContact,
    this.addressName,
    this.city,
    this.pincode,
  });

  factory AddressDatum.fromJson(Map<String, dynamic> json) => AddressDatum(
        addressType: json["address_type"],
        phoneNo: json["phone_no"],
        state: json["state"],
        addressId: json["address_id"],
        userContact: json["user_contact"],
        addressName: json["address_name"],
        city: json["city"],
        pincode: json["pincode"],
      );

  Map<String, dynamic> toJson() => {
        "address_type": addressType,
        "phone_no": phoneNo,
        "state": state,
        "address_id": addressId,
        "user_contact": userContact,
        "address_name": addressName,
        "city": city,
        "pincode": pincode,
      };
}
