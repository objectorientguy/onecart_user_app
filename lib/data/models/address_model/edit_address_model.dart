// To parse this JSON data, do
//
//     final editAddressModel = editAddressModelFromJson(jsonString);

import 'dart:convert';

EditAddressModel editAddressModelFromJson(String str) =>
    EditAddressModel.fromJson(json.decode(str));

String editAddressModelToJson(EditAddressModel data) =>
    json.encode(data.toJson());

class EditAddressModel {
  List<Detail> detail;

  EditAddressModel({
    required this.detail,
  });

  factory EditAddressModel.fromJson(Map<String, dynamic> json) =>
      EditAddressModel(
        detail:
            List<Detail>.from(json["detail"].map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "detail": List<dynamic>.from(detail.map((x) => x.toJson())),
      };
}

class Detail {
  String type;
  List<String> loc;
  String msg;
  Input input;
  String url;

  Detail({
    required this.type,
    required this.loc,
    required this.msg,
    required this.input,
    required this.url,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        type: json["type"],
        loc: List<String>.from(json["loc"].map((x) => x)),
        msg: json["msg"],
        input: Input.fromJson(json["input"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "loc": List<dynamic>.from(loc.map((x) => x)),
        "msg": msg,
        "input": input.toJson(),
        "url": url,
      };
}

class Input {
  String userContact;
  String addressType;
  String addressName;
  int phoneNo;
  String city;
  String state;
  int pincode;

  Input({
    required this.userContact,
    required this.addressType,
    required this.addressName,
    required this.phoneNo,
    required this.city,
    required this.state,
    required this.pincode,
  });

  factory Input.fromJson(Map<String, dynamic> json) => Input(
        userContact: json["user_contact"],
        addressType: json["address_type"],
        addressName: json["address_name"],
        phoneNo: json["phone_no"],
        city: json["city"],
        state: json["state"],
        pincode: json["pincode"],
      );

  Map<String, dynamic> toJson() => {
        "user_contact": userContact,
        "address_type": addressType,
        "address_name": addressName,
        "phone_no": phoneNo,
        "city": city,
        "state": state,
        "pincode": pincode,
      };
}
