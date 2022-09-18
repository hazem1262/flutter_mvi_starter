import 'dart:convert';
import 'package:flutter_mvi_starter/data/remote/auth/models/user_image.dart';
import 'package:flutter_mvi_starter/generated/json/base/json_field.dart';
import 'package:flutter_mvi_starter/generated/json/user_entity.g.dart';

@JsonSerializable()
class UserEntity {
  bool? status;
  UserMobileUserData? mobileUserData;
  String? message;
  String? token;

  UserEntity();

  factory UserEntity.fromJson(Map<String, dynamic> json) => $UserEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserMobileUserData {
  String? userId;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  @JSONField(name: "role_Id")
  String? roleId;
  @JSONField(name: "role_Title")
  String? roleTitle;
  @JSONField(name: "countryCode")
  String? countryCode;
  @JSONField(name: "profileImageUrl")
  String? profileImagePath;
  String? gender;
  String? birthDate;
  int? genderCode;
  UserImage? userImage;

  factory UserMobileUserData.fromJson(Map<String, dynamic> json) => $UserMobileUserDataFromJson(json);

  Map<String, dynamic> toJson() => $UserMobileUserDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  UserMobileUserData({
    this.userId,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.roleId,
    this.roleTitle,
    this.countryCode,
    this.profileImagePath,
    this.gender,
    this.birthDate,
    this.genderCode,
    this.userImage
  });
}
