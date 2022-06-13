import 'dart:convert';

class UserModel {
  UserModel({
    required this.model,
    required this.address,
    required this.email,
    this.id,
    required this.name,
    required this.vehNum,
    this.status,
  });

  String model;
  String address;
  String email;
  String? id;
  String name;
  String vehNum;
  String? status;

  // factory UserModel.fromRawJson(String str) =>
  //     UserModel.fromJson(json.decode(str));

  // String toRawJson() => json.encode(toJson());

  // factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
  //       model: json["Model"],
  //       address: json["address"],
  //       email: json["email"],
  //       id: json["id"],
  //       name: json["name"],
  //       vehNum: json["vehNum"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "Model": model,
  //       "address": address,
  //       "email": email,
  //       "id": id,
  //       "name": name,
  //       "vehNum": vehNum,
  //     };
}
