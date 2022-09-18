import 'package:flutter_mvi_starter/data/local/shared_prefs_manager.dart';
import 'package:flutter_mvi_starter/di/service_locator.dart';
import 'package:flutter_mvi_starter/utils/network/api_response.dart';
import 'package:flutter_mvi_starter/utils/network/application_error.dart';

Future<void> handleResponse({required ApiResponse result, Function? onSuccess, Function? onFailed}) async {
  if (result.status == Status.OK) {
    await onSuccess?.call();
  } else if (result.status == Status.FAILED) {
    if (result.error?.type is Unauthorized) {
      logOut();
    }
    // analytics.logEvent(name: debugBaseControllerOnFailed, parameters: {debugErrorMessage:result.error.errorMsg});
    await onFailed?.call();
  }
  return Future.value();
}

void logOut() {
  final SharedPrefsManager sharedPrefsManager = getIt.get<SharedPrefsManager>();
  sharedPrefsManager.credentials = null;
  // navigationKey.currentState?.pushNamedAndRemoveUntil(SubDomainVerificationScreen.tag, (route) => false);
}
