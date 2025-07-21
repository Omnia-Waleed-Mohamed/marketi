import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/constant/string.dart';
import 'package:marketi/features/auth/login/view/login_view.dart';
import 'package:marketi/features/auth/sign_up/view/sign_up_view.dart';
import 'package:marketi/features/onboarding/view/on_boarding_view.dart';
import 'package:marketi/features/onboarding/view/splash_view.dart';
import 'package:marketi/features/onboarding/view_model/cubit/on_boarding_cubit.dart';

class AppRouter {
  Route generatRoute(RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => SplashView());

      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => OnBoardingCubit(),
            child: OnBoardingView(),
          ),
        );

       case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginView());

        case Routes.signup:
        return MaterialPageRoute(builder: (_) => SignUpView());
 
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route ${settings.name}'),
                  ),
                ));
    }
  }
}
