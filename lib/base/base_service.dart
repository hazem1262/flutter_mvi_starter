import 'dart:io';
import 'package:flutter_mvi_starter/data/local/shared_prefs_manager.dart';
import 'package:flutter_mvi_starter/di/service_locator.dart';
import 'package:flutter_mvi_starter/utils/network/network_manager.dart';
import 'package:flutter_mvi_starter/utils/utils.dart';

class BaseService {
  final SharedPrefsManager sharedPrefsManager = getIt.get<SharedPrefsManager>();
  final NetworkManager networkManager = getIt.get<NetworkManager>();

  Map<String, String> get authenticatedHeaders {
    return headers..addAll({"Authorization": "Bearer ${sharedPrefsManager.accessToken ?? ''}"});
  }

  Map<String, String> get headers {
    return {"Accept": "application/json", "Content-Type": "application/json", "Accept-Language": isArabic ? 'ar-SA' : 'en-US'};
  }

  Future<String> get platform async {
    if (Platform.isIOS) {
      return 'ios';
    } else if (Platform.isAndroid) {
      if (await isHuaweiDevice()) {
        return 'huawei';
      } else {
        return 'android';
      }
    } else {
      return 'unsupported';
    }
  }
}

const String huawei = 'huawei';
const String android = 'android';
const String ios = 'ios';
