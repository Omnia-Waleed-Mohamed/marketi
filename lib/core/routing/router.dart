import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketi/core/constant/string.dart';
import 'package:marketi/features/onboarding/view/splash_view.dart';

class AppRouter {
  Route generatRoute(RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => SplashView());

      default:
       return   MaterialPageRoute(builder: (_)=>Scaffold(
         body: Center(
          child: Text('No route ${settings.name}'),
         ),
       )) ; 
    }
  }
}
