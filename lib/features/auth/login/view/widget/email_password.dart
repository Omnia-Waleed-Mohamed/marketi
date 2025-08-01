import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/helper/app_regex.dart';
import 'package:marketi/core/widget/custom_text_field.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

static final GlobalKey<_EmailAndPasswordState> globalKey =
      GlobalKey<_EmailAndPasswordState>();


  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {

final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  

  bool hasLowerCase =false;
  bool hasUpperCase =false;
  bool hasSpecialCharacter =false;
  bool hasNumber =false;
  bool hasMinLenght =false;
  bool isPasswordObscureText =false;
  //late TextEditingController passwordController;

   final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override

 void initState(){

  super.initState();
   passwordControllerListner();

 }

 void passwordControllerListner(){

  passwordController.addListener((){
    setState(() {
      hasLowerCase =AppRegex.hasLowerCase(passwordController.text);
      hasUpperCase =AppRegex.hasUpperCase(passwordController.text);
      hasSpecialCharacter =AppRegex.hasSpecialCharacter(passwordController.text);
      hasMinLenght =AppRegex.hasMinLength(passwordController.text); 
    });

  });

 }
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: 
    Column(
      children: [
        CustomTextField(
          controller: emailController,
           hintText: 'Username or Email', validator: (value){
              if(value == null || value.isEmpty || !AppRegex.isEmailValid(value)){
                return 'please enter a valid email ';
              }
        },
        prefixIcon: Icon(Icons.email_outlined,size: 18.sp,),),
        SizedBox(
          height: 12.h,
        ),
        CustomTextField(
          controller: passwordController,
          hintText: 'Password', validator: (value){
          if(value == null || value.isEmpty || !AppRegex.isPasswordValid(value)){
                return 'please enter a valid password ';
              }
        },
        prefixIcon: Icon(Icons.lock_outline_rounded),)
      ],
    )
    );
  }
  String get email => emailController.text;
  String get password => passwordController.text;
  bool validateForm() => formKey.currentState?.validate() ?? false;
}