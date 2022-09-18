import 'package:flutter_mvi_starter/data/local/shared_prefs_manager.dart';
import 'package:flutter_mvi_starter/utils/network/network_manager.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static init() {
    initSharedPreference();
    initNetworkManager();
  }

  static Future<void> initSharedPreference() async {
    final SharedPrefsManager sharedPrefsManager = SharedPrefsManager();
    await sharedPrefsManager.init();
    getIt.registerSingleton<SharedPrefsManager>(sharedPrefsManager);
  }

  static initNetworkManager() {
    getIt.registerLazySingleton<NetworkManager>(() => NetworkManager());
  }
}
