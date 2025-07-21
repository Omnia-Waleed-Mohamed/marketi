import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/constant/string.dart';
import 'package:marketi/core/routing/router.dart';

void main() {
  runApp( Marketi(appRouter: AppRouter(),));
}


//https://www.figma.com/design/dlv95BuNaWuUECHDODNM5A/Marketi%D9%90_E-commerce-app?node-id=153-262&p=f&t=8FX45Ih0FNqUMjwP-0

class Marketi extends StatelessWidget {
  const Marketi({super.key,required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375,812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Marketi',
        theme: ThemeData(),

        onGenerateRoute: appRouter.generatRoute,
        initialRoute: Routes.signup,
        
      ),
    );
  }
}