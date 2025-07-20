import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/constant/color.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 347,
      child: MaterialButton(
        color: AppColor.kPrimaryColor,
        textColor: Colors.white,
        padding: EdgeInsets.only(right: 50.w,left: 50.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.r)
        ),
        onPressed: onPressed,child:
      Text(text,style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,

      ),) 
      ,
      ),
    );
  }
}