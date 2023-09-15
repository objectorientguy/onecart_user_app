// To parse this JSON data, do
//
//     final getAllAddressModel = getAllAddressModelFromJson(jsonString);

import 'dart:convert';

GetAllAddressModel getAllAddressModelFromJson(String str) => GetAllAddressModel.fromJson(json.decode(str));

String getAllAddressModelToJson(GetAllAddressModel data) => json.encode(data.toJson());

class GetAllAddressModel {
  String status;
  String message;
  List<AddressDatum> data;

  GetAllAddressModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetAllAddressModel.fromJson(Map<String, dynamic> json) => GetAllAddressModel(
    status: json["status"],
    message: json["message"],
    data: List<AddressDatum>.from(json["data"].map((x) => AddressDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class AddressDatum {
  int userContact;
  String addressName;
  String addressType;
  String city;
  int pincode;
  int addressId;
  int phoneNo;
  String state;
  String? name;

  AddressDatum({
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

  factory AddressDatum.fromJson(Map<String, dynamic> json) => AddressDatum(
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
