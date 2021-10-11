import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mvi_starter/app_observer.dart';
import 'package:flutter_mvi_starter/di/modules/app_module.dart';
import 'package:flutter_mvi_starter/presentation/test/joke/joke_screen.dart';
import 'package:flutter_mvi_starter/utils/navigation/navigation_helper.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppModule().initialise(Injector()); // initialize simple dependency injector
  Bloc.observer = AppObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: navigationKey,
      onGenerateRoute: getApplicationRoute,
      initialRoute: JokeScreen.tag,
    );
  }
}


