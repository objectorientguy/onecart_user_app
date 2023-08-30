// To parse this JSON data, do
//
//     final addAddressModel = addAddressModelFromJson(jsonString);

import 'dart:convert';

AddAddressModel addAddressModelFromJson(String str) =>
    AddAddressModel.fromJson(json.decode(str));

String addAddressModelToJson(AddAddressModel data) =>
    json.encode(data.toJson());

class AddAddressModel {
  final String? status;
  final String? message;
  final AddAddressData? data;

  AddAddressModel({
    this.status,
    this.message,
    this.data,
  });

  factory AddAddressModel.fromJson(Map<String, dynamic> json) =>
      AddAddressModel(
        status: json["status"],
        message: json["message"],
        data:
            json["data"] == null ? null : AddAddressData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class AddAddressData {
  final int? userContact;
  final String? addressName;
  final int? addressId;
  final String? city;
  final int? pincode;
  final String? addressType;
  final int? phoneNo;
  final String? state;

  AddAddressData({
    this.userContact,
    this.addressName,
    this.addressId,
    this.city,
    this.pincode,
    this.addressType,
    this.phoneNo,
    this.state,
  });

  factory AddAddressData.fromJson(Map<String, dynamic> json) => AddAddressData(
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
