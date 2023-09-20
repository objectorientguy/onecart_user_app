// To parse this JSON data, do
//
//     final addAddressModel = addAddressModelFromJson(jsonString);

import 'dart:convert';

AddAddressModel addAddressModelFromJson(String str) =>
    AddAddressModel.fromJson(json.decode(str));

String addAddressModelToJson(AddAddressModel data) =>
    json.encode(data.toJson());

class AddAddressModel {
  String status;
  String message;
  AddAddressData data;

  AddAddressModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddAddressModel.fromJson(Map<String, dynamic> json) =>
      AddAddressModel(
        status: json["status"],
        message: json["message"],
        data: AddAddressData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class AddAddressData {
  int userContact;
  String addressName;
  String addressType;
  String city;
  int pincode;
  int addressId;
  int phoneNo;
  String state;
  String name;

  AddAddressData({
    required this.userContact,
    required this.addressName,
    required this.addressType,
    required this.city,
    required this.pincode,
    required this.addressId,
    required this.phoneNo,
    required this.state,
    required this.name,
  });

  factory AddAddressData.fromJson(Map<String, dynamic> json) => AddAddressData(
        userContact: json["user_contact"],
        addressName: json["address_name"],
        addressType: json["address_type"],
        city: json["city"],
        pincode: json["pincode"],
        addressId: json["address_id"],
        phoneNo: json["phone_no"],
        state: json["state"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "user_contact": userContact,
        "address_name": addressName,
        "address_type": addressType,
        "city": city,
        "pincode": pincode,
        "address_id": addressId,
        "phone_no": phoneNo,
        "state": state,
        "name": name,
      };
}
