import 'package:flutter_mvi_starter/generated/json/base/json_field.dart';
import 'package:flutter_mvi_starter/generated/json/user_image.g.dart';

@JsonSerializable()
class UserImage {
  bool? isLocalImage;
  String? imagePath;

  factory UserImage.fromJson(Map<String, dynamic> json) => $UserImageFromJson(json);

  Map<String, dynamic> toJson() => $UserImageToJson(this);

  //This model used to differentiate between network and local images
  UserImage({
    this.isLocalImage,
    this.imagePath
  });
}
