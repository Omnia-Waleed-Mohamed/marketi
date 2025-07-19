import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketi/core/constant/string.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override

 void initState(){

  super.initState();
  Timer(Duration(seconds: 2),(){
     Navigator.pushReplacementNamed(context, Routes.onBoarding);
  });

 } 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Center(
        child: Image.asset('assets/images/Logo_Splash_Screen.png'),
      ),
    );
  }
}