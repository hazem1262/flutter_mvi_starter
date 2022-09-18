import 'dart:convert';
import 'package:flutter_mvi_starter/data/remote/auth/models/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsManager {
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    return;
  }

  SharedPreferences? prefs;

  String get locale {
    return prefs?.getString(appSavedLocaleKey) ?? "";
  }

  set locale(String savedLocale) {
    prefs?.setString(appSavedLocaleKey, savedLocale);
  }

  UserEntity? get credentials {
    var loginString = prefs?.getString(appLoginCredentialsKey) ?? "";
    if (loginString.isNotEmpty) {
      return UserEntity.fromJson(json.decode(loginString));
    } else {
      return null;
    }
  }

  set credentials(UserEntity? loginResponseEntity) {
    prefs?.setString(appLoginCredentialsKey, (loginResponseEntity != null) ? json.encode(loginResponseEntity.toJson()) : "");
  }

  String get subDomain {
    return prefs?.getString(subDomainKey) ?? "";
  }

  set subDomain(String subDomain) {
    prefs?.setString(subDomainKey, subDomain);
  }

  String? get accessToken {
    if (credentials != null) {
      return credentials!.token;
    }
    return null;
  }

  String? get userId {
    return credentials!.mobileUserData!.userId;
  }
}

const String appSavedLocaleKey = 'appSavedLocaleKey';
const String appLoginCredentialsKey = "appLoginCredentialsKey";
const String subDomainKey = "subDomainKey";
const String firebaseTokenKey = "firebaseToken";
const String token = "token";
const String uid = "uid";
