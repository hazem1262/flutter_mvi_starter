import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_mvi_starter/utils/navigation/navigation_helper.dart';
import 'package:flutter_mvi_starter/utils/style/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_api_availability/google_api_availability.dart';
import 'package:url_launcher/url_launcher.dart';

Future<bool> isHuaweiDevice() async {
  GooglePlayServicesAvailability availability = await GoogleApiAvailability.instance.checkGooglePlayServicesAvailability();
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  return androidInfo.manufacturer == "HUAWEI" &&
      (availability == GooglePlayServicesAvailability.serviceInvalid || availability == GooglePlayServicesAvailability.serviceMissing);
}

bool get isArabic => Localizations.localeOf(navigationKey.currentContext!).languageCode == 'ar';

bool isLiveServer() {
  return false; // todo(update after configure servers)
}

showErrorMsg(String errorMsg) {
  print("error: $errorMsg");
  Fluttertoast.showToast(
      msg: errorMsg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

showSuccessMsg(String errorMsg) {
  Fluttertoast.showToast(
      msg: errorMsg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.greenAccent,
      textColor: Colors.white,
      fontSize: 16.0);
}

Future<File> compressAndGetFile(
    File file,
    ) async {
  final filePath = file.absolute.path;
  // Create output file path
  // eg:- "Volume/VM/abcd_out.jpeg"
  final lastIndex = filePath.lastIndexOf(".");
  final splitted = filePath.substring(0, (lastIndex));
  final outPath = "${splitted}_out${getFileExtension(filePath.substring(lastIndex))}";
  print("path:$outPath");
  var result = await FlutterImageCompress.compressAndGetFile(file.absolute.path, outPath, quality: 50, format: getFormat(filePath));

  print("original file:  ${file.lengthSync()}");
  print("compressed file: ${result?.lengthSync()}");

  if (result != null) {
    return result;
  } else {
    return file;
  }
}

String getFileExtension(String substring) {
  if (substring == '.jpg' || substring == '.jpeg' || substring == '.png' || substring == '.heic' || substring == '.webp') {
    return substring;
  } else {
    return '.jpg';
  }
}

CompressFormat getFormat(String filePath) {
  if (filePath.endsWith(".jpg") || filePath.endsWith(".jpeg")) {
    return CompressFormat.jpeg;
  } else if (filePath.endsWith(".png")) {
    return CompressFormat.png;
  } else if (filePath.endsWith(".heic")) {
    return CompressFormat.heic;
  } else if (filePath.endsWith(".webp")) {
    return CompressFormat.webp;
  }
  return CompressFormat.jpeg;
}

Future<void> openWhatsApp({String phone = ""}) async {
  var whatsAppUrl = "whatsapp://send?phone=+966550592033";
  Uri uri = Uri.parse(whatsAppUrl);
  await canLaunchUrl(uri)
      ? launchUrl(uri)
      : Fluttertoast.showToast(
      msg: "This phone does not contain Whatsapp",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: AppColors.lotion
  );
}
