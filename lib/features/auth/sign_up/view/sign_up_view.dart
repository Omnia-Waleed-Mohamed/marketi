import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marketi/core/constant/color.dart';
import 'package:marketi/core/widget/custom_arrow_back.dart';
import 'package:marketi/core/widget/custom_buttom.dart';
import 'package:marketi/core/widget/custom_text_field.dart';
import 'package:marketi/features/auth/login/view/widget/custom_other_login.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SiState();
}

class _SiState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 22.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomArrowBack(),
                SizedBox(
                  width: 16.w,
                ),
                Image.asset(
                  'assets/images/Logo_Log_In.png',
                  height: 140.h,
                  width: 160.w,
                )
              ],
            ),
            Text(
              'Your Name',
              style: TextStyle(
                color: AppColor.darkBlue,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            CustomTextField(
              hintText: 'Full Name',
              validator: (value) {},
              prefixIcon: Padding(
                padding: EdgeInsets.only(top: 12, left: 14, bottom: 14),
                child: FaIcon(
                  FontAwesomeIcons.userPen,
                  size: 16,
                ),
              ),
            ),
            Text(
              'Phone Number',
              style: TextStyle(
                color: AppColor.darkBlue,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            CustomTextField(
              hintText: '+20 1501142409',
              validator: (value) {},
              prefixIcon: Padding(
                padding: EdgeInsets.only(top: 12, left: 14, bottom: 14),
                child: FaIcon(
                  FontAwesomeIcons.mobileScreenButton,
                  size: 16,
                ),
              ),
            ),
            Text(
              'Email',
              style: TextStyle(
                color: AppColor.darkBlue,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            CustomTextField(
              hintText: 'You@gmail.com ',
              validator: (value) {},
              prefixIcon: Padding(
                padding: EdgeInsets.only(top: 12, left: 14, bottom: 14),
                child: FaIcon(
                  FontAwesomeIcons.envelope,
                  size: 16,
                ),
              ),
            ),
            Text(
              'Password',
              style: TextStyle(
                color: AppColor.darkBlue,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            CustomTextField(
              hintText: 'Password',
              validator: (value) {},
              prefixIcon: Icon(
                Icons.lock_outline_rounded,
                size: 18,
              ),
            ),
            Text(
              'Confirm Password',
              style: TextStyle(
                color: AppColor.darkBlue,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            CustomTextField(
              hintText: 'Confirm Password',
              validator: (value) {},
              prefixIcon: Icon(
                Icons.lock_outline_rounded,
                size: 18,
              ),
            ),

            SizedBox(height: 12.h,),
            CustomButtom(text: 'Sign Up', onPressed: (){}),
             SizedBox(height: 12.h,),
            Align(
                alignment: Alignment.center,
                child: Text('Or Continue With',style: TextStyle(
                  fontSize: 12.sp,fontWeight: FontWeight.w400,
                  color: Color(0xff51526C)
                ),),
               ),
                SizedBox(height: 12.h,),
               CustomOtherLogin(),
          ],
        ),
      )),
    );
  }
}
