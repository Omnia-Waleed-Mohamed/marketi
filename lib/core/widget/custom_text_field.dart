import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.contentpading, this.focusedBorder, this.enabledBorder,  this.errorBorder,  this.focuseErrorBorder, this.inputTextStyle, required this.hintText, this.onSaved, this.onChanged, this.isObscureText, this.suffixIcon, this.prefixIcon, this.backgroundColor, required this.validator, this.controller});

  final EdgeInsetsGeometry? contentpading;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focuseErrorBorder;
  final TextStyle? inputTextStyle;
  final String hintText;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final Function(String?) validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {

    double height =MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;
    return  Container(
      height: 48.h,
              width: 331.w,
      child: TextFormField(
        controller: controller,
        onChanged:onChanged ,
        onSaved:onSaved ,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: contentpading ?? EdgeInsets.symmetric(horizontal: 12.w,vertical: 10.h),
          constraints: BoxConstraints(
            maxHeight: height*0.0625,
            maxWidth: width,
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0xff929BAB),
            fontSize: 14.sp,
            fontWeight: FontWeight.normal
          ),
          enabledBorder: enabledBorder ?? customBorder(Colors.lightBlue.shade100),
          focusedBorder: focusedBorder ?? customBorder(Colors.lightBlue.shade100),
          errorBorder: errorBorder?? customBorder(Colors.red),
          errorStyle: TextStyle(fontSize: 12.sp),
          focusedErrorBorder: focusedBorder ?? customBorder(Colors.red)
          
        ),
        validator: (value){
           return validator(value);
        },
      
      ),
    );
  }
  OutlineInputBorder customBorder([Color? color]){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color:color?? Color(0xffB2ccf),
        width: 1.5

      )
    );
  }
}