// To parse this JSON data, do
//
//     final editAddressModel = editAddressModelFromJson(jsonString);

import 'dart:convert';

EditAddressModel editAddressModelFromJson(String str) => EditAddressModel.fromJson(json.decode(str));

String editAddressModelToJson(EditAddressModel data) => json.encode(data.toJson());

class EditAddressModel {
  final String? status;
  final String? message;
  final Data? data;

  EditAddressModel({
    this.status,
    this.message,
    this.data,
  });

  factory EditAddressModel.fromJson(Map<String, dynamic> json) => EditAddressModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  final int? userContact;
  final String? addressName;
  final int? addressId;
  final String? city;
  final int? pincode;
  final String? addressType;
  final int? phoneNo;
  final String? state;

  Data({
    this.userContact,
    this.addressName,
    this.addressId,
    this.city,
    this.pincode,
    this.addressType,
    this.phoneNo,
    this.state,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userContact: json["user_contact"],
    addressName: json["address_name"],
    addressId: json["address_id"],
    city: json["city"],
    pincode: json["pincode"],
    addressType: json["address_type"],
    phoneNo: json["phone_no"],
    state: json["state"],
  );

  Map<String, dynamic> toJson() => {
    "user_contact": userContact,
    "address_name": addressName,
    "address_id": addressId,
    "city": city,
    "pincode": pincode,
    "address_type": addressType,
    "phone_no": phoneNo,
    "state": state,
  };
}
