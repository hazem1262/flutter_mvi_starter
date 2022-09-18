import 'package:flutter_mvi_starter/generated/json/base/json_convert_content.dart';
import 'package:flutter_mvi_starter/data/remote/auth/models/user_image.dart';

UserImage $UserImageFromJson(Map<String, dynamic> json) {
	final UserImage userImage = UserImage();
	final bool? isLocalImage = jsonConvert.convert<bool>(json['isLocalImage']);
	if (isLocalImage != null) {
		userImage.isLocalImage = isLocalImage;
	}
	final String? imagePath = jsonConvert.convert<String>(json['imagePath']);
	if (imagePath != null) {
		userImage.imagePath = imagePath;
	}
	return userImage;
}

Map<String, dynamic> $UserImageToJson(UserImage entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['isLocalImage'] = entity.isLocalImage;
	data['imagePath'] = entity.imagePath;
	return data;
}