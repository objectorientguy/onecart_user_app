// To parse this JSON data, do
//
//     final editAddressModel = editAddressModelFromJson(jsonString);

import 'dart:convert';

EditAddressModel editAddressModelFromJson(String str) =>
    EditAddressModel.fromJson(json.decode(str));

String editAddressModelToJson(EditAddressModel data) =>
    json.encode(data.toJson());

class EditAddressModel {
  final String status;
  final String message;
  final Data data;

  EditAddressModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory EditAddressModel.fromJson(Map<String, dynamic> json) =>
      EditAddressModel(
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
  final int addressId;
  final int phoneNo;
  final String state;
  final String name;
  final int userContact;
  final String addressName;
  final String addressType;
  final String city;
  final int pincode;

  Data({
    required this.addressId,
    required this.phoneNo,
    required this.state,
    required this.name,
    required this.userContact,
    required this.addressName,
    required this.addressType,
    required this.city,
    required this.pincode,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        addressId: json["address_id"],
        phoneNo: json["phone_no"],
        state: json["state"],
        name: json["name"],
        userContact: json["user_contact"],
        addressName: json["address_name"],
        addressType: json["address_type"],
        city: json["city"],
        pincode: json["pincode"],
      );

  Map<String, dynamic> toJson() => {
        "address_id": addressId,
        "phone_no": phoneNo,
        "state": state,
        "name": name,
        "user_contact": userContact,
        "address_name": addressName,
        "address_type": addressType,
        "city": city,
        "pincode": pincode,
      };
}
