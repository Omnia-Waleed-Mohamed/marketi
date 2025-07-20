import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOtherLogin extends StatelessWidget {
  const CustomOtherLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 40.h,
          width: 40.w,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(shape: 
          RoundedRectangleBorder(
            side: BorderSide(
              width: 0.5.w,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Color(0xffB2B2ccff),
            ),
            borderRadius: BorderRadius.circular(40.r)
          )),
          child: 
            
              Image.asset('assets/images/Google_Icon.png')
            ,

          
        ),
        SizedBox(width: 14.w,),
        Container(
          height: 40.h,
          width: 40.w,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(shape: 
          RoundedRectangleBorder(
            side: BorderSide(
              width: 0.5.w,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Color(0xffB2B2ccff),
            ),
            borderRadius: BorderRadius.circular(40.r)
          )),
          child: 
            
              Image.asset('assets/images/Facebok_Icon.png')
            ,

          
        ),
        SizedBox(width: 14.w,),
        Container(
          height: 40.h,
          width: 40.w,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(shape: 
          RoundedRectangleBorder(
            side: BorderSide(
              width: 0.5.w,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Color(0xffB2B2ccff),
            ),
            borderRadius: BorderRadius.circular(40.r)
          )),
          child: 
            
              Image.asset('assets/images/Apple_Icon.png')
            ,

          
        ),

      ],
    );
  }
}