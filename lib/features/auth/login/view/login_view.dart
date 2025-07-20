import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/features/auth/login/view/widget/email_password.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 52.w),
              child: Image.asset(
                'assets/images/Logo_Log_In.png',
                height: 232.h,
                width: 272.w,
              ),
            ),
            
               EmailAndPassword(),
          ],
        ),
      )
    );
  }
}
