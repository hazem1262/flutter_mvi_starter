import 'package:flutter/material.dart';
import 'package:flutter_mvi_starter/presentation/test/joke/joke_screen.dart';
import 'package:flutter_mvi_starter/presentation/test/joke_details/joke_details_screen.dart';

final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

Route getApplicationRoute(RouteSettings settings) {
  switch (settings.name){
    case JokeScreen.tag:
      return _buildRoute(settings, const JokeScreen());

    case JokeDetailsScreen.tag:
      return _buildRoute(settings, const JokeDetailsScreen());

    default:
      throw Exception("un registered route");
  }
}

PageRouteBuilder _buildRoute(RouteSettings settings, Widget page, {int transitionTime = 400, Offset transitionBegin = Offset.zero}){
  return PageRouteBuilder(
    settings: settings,
    transitionDuration: Duration(milliseconds: transitionTime),
    pageBuilder: (BuildContext context, _, __) => page,
    transitionsBuilder: (_, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      return FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: transitionBegin,
            end: Offset.zero,
          ).animate(animation),
          child: child, // child is the value returned by pageBuilder
        ),
      );
    }
  );
}