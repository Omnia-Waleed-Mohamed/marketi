import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/constant/color.dart';
import 'package:marketi/core/widget/custom_buttom.dart';
import 'package:marketi/features/auth/login/view/widget/custom_other_login.dart';
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
               Align(
                alignment: Alignment.centerRight,
                 child: Padding(
                   padding: EdgeInsets.only(top: 4.h,right: 28.w),
                   child: InkWell(
                    onTap: (){},
                    child: Text('Forgot Password?',
                    style: TextStyle(
                      color: AppColor.kPrimaryColor,
                      fontSize: 12.sp,
                      fontWeight:FontWeight.w500,
                    ),),
                   ),
                 ),
               ),
               SizedBox(height: 12.h,),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 20.w),
                 child: CustomButtom(text: 'Log In', onPressed: (){}),
               ),
               SizedBox(height: 14.sp,),
               Align(
                alignment: Alignment.center,
                child: Text('Or Continue With',style: TextStyle(
                  fontSize: 12.sp,fontWeight: FontWeight.w400,
                  color: Color(0xff51526C)
                ),),
               ),
               SizedBox(
                height: 14.h,
               ),
             CustomOtherLogin(),
             SizedBox(height: 12.h,),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Text('Are you new in Marketi ',style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff51526C)
                  ),),
                  InkWell(
                    child: Text('register?',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColor.kPrimaryColor,
                      fontWeight: FontWeight.w500,
                    ),),
                  )
              ],
             )
          ],
        ),
      )
    );
  }
}
