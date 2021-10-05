import 'package:flutter_mvi_starter/utils/network/network_manager.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class AppModule {
  Injector initialise(Injector injector) {
    injector.map<NetworkManager>((i) => NetworkManager(), isSingleton: true);
    return injector;
  }
}