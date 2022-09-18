import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mvi_starter/app_observer.dart';
import 'package:flutter_mvi_starter/di/modules/app_module.dart';
import 'package:flutter_mvi_starter/di/service_locator.dart';
import 'package:flutter_mvi_starter/presentation/test/joke/joke_screen.dart';
import 'package:flutter_mvi_starter/utils/const.dart';
import 'package:flutter_mvi_starter/utils/navigation/navigation_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppModule().initialise(Injector()); // initialize simple dependency injector
  Bloc.observer = AppObserver();
  await EasyLocalization.ensureInitialized();
  ServiceLocator.init();
  runApp(
    ProviderScope(
      child: EasyLocalization(
        path: 'assets/translations',
        supportedLocales: localeList,
        fallbackLocale: englishLocale,
        useOnlyLangCode: true,
        child: const MyApp(),
      ),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: navigationKey,
      onGenerateRoute: getApplicationRoute,
      initialRoute: JokeScreen.tag,
    );
  }
}


