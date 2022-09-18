import 'package:flutter_mvi_starter/generated/json/base/json_convert_content.dart';
import 'package:flutter_mvi_starter/data/remote/auth/models/user_entity.dart';
import 'package:flutter_mvi_starter/data/remote/auth/models/user_image.dart';


UserEntity $UserEntityFromJson(Map<String, dynamic> json) {
	final UserEntity userEntity = UserEntity();
	final bool? status = jsonConvert.convert<bool>(json['status']);
	if (status != null) {
		userEntity.status = status;
	}
	final UserMobileUserData? mobileUserData = jsonConvert.convert<UserMobileUserData>(json['mobileUserData']);
	if (mobileUserData != null) {
		userEntity.mobileUserData = mobileUserData;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		userEntity.message = message;
	}
	final String? token = jsonConvert.convert<String>(json['token']);
	if (token != null) {
		userEntity.token = token;
	}
	return userEntity;
}

Map<String, dynamic> $UserEntityToJson(UserEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['status'] = entity.status;
	data['mobileUserData'] = entity.mobileUserData?.toJson();
	data['message'] = entity.message;
	data['token'] = entity.token;
	return data;
}

UserMobileUserData $UserMobileUserDataFromJson(Map<String, dynamic> json) {
	final UserMobileUserData userMobileUserData = UserMobileUserData();
	final String? userId = jsonConvert.convert<String>(json['userId']);
	if (userId != null) {
		userMobileUserData.userId = userId;
	}
	final String? username = jsonConvert.convert<String>(json['username']);
	if (username != null) {
		userMobileUserData.username = username;
	}
	final String? firstName = jsonConvert.convert<String>(json['firstName']);
	if (firstName != null) {
		userMobileUserData.firstName = firstName;
	}
	final String? lastName = jsonConvert.convert<String>(json['lastName']);
	if (lastName != null) {
		userMobileUserData.lastName = lastName;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		userMobileUserData.email = email;
	}
	final String? phone = jsonConvert.convert<String>(json['phone']);
	if (phone != null) {
		userMobileUserData.phone = phone;
	}
	final String? roleId = jsonConvert.convert<String>(json['role_Id']);
	if (roleId != null) {
		userMobileUserData.roleId = roleId;
	}
	final String? roleTitle = jsonConvert.convert<String>(json['role_Title']);
	if (roleTitle != null) {
		userMobileUserData.roleTitle = roleTitle;
	}
	final String? countryCode = jsonConvert.convert<String>(json['countryCode']);
	if (countryCode != null) {
		userMobileUserData.countryCode = countryCode;
	}
	final String? profileImagePath = jsonConvert.convert<String>(json['profileImageUrl']);
	if (profileImagePath != null) {
		userMobileUserData.profileImagePath = profileImagePath;
	}
	final String? gender = jsonConvert.convert<String>(json['gender']);
	if (gender != null) {
		userMobileUserData.gender = gender;
	}
	final String? birthDate = jsonConvert.convert<String>(json['birthDate']);
	if (birthDate != null) {
		userMobileUserData.birthDate = birthDate;
	}
	final int? genderCode = jsonConvert.convert<int>(json['genderCode']);
	if (genderCode != null) {
		userMobileUserData.genderCode = genderCode;
	}
	final UserImage? userImage = jsonConvert.convert<UserImage>(json['userImage']);
	if (userImage != null) {
		userMobileUserData.userImage = userImage;
	}
	return userMobileUserData;
}

Map<String, dynamic> $UserMobileUserDataToJson(UserMobileUserData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['userId'] = entity.userId;
	data['username'] = entity.username;
	data['firstName'] = entity.firstName;
	data['lastName'] = entity.lastName;
	data['email'] = entity.email;
	data['phone'] = entity.phone;
	data['role_Id'] = entity.roleId;
	data['role_Title'] = entity.roleTitle;
	data['countryCode'] = entity.countryCode;
	data['profileImageUrl'] = entity.profileImagePath;
	data['gender'] = entity.gender;
	data['birthDate'] = entity.birthDate;
	data['genderCode'] = entity.genderCode;
	data['userImage'] = entity.userImage?.toJson();
	return data;
}