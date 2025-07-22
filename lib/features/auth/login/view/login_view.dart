
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/constant/color.dart';
import 'package:marketi/core/constant/string.dart';
import 'package:marketi/core/widget/custom_buttom.dart';
import 'package:marketi/features/auth/login/data/model/login_model.dart';
import 'package:marketi/features/auth/login/view/widget/custom_other_login.dart';
import 'package:marketi/features/auth/login/view/widget/email_password.dart';
import 'package:marketi/features/auth/login/view_model/login_state.dart';
import 'package:marketi/features/auth/login/view_model/lohin_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginLoading) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const Center(child: CircularProgressIndicator()),
              );
            } else if (state is LoginSuccess) {
              Navigator.pop(context); // Close loading
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Login Success.")),
              );
              Navigator.pushReplacementNamed(context, Routes.home);
              // Navigate to home screen or save token
            } else if (state is LoginFailure) {
              Navigator.pop(context); // Close loading
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 50.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 52.w),
                    child: Image.asset(
                      'assets/images/Logo_Log_In.png',
                      height: 232.h,
                      width: 272.w,
                    ),
                  ),
                  EmailAndPassword(key: EmailAndPassword.globalKey),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 4.h, right: 8.w),
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: AppColor.kPrimaryColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  CustomButtom(
                    text: 'Log In',
                    onPressed: () {
                      final formState = EmailAndPassword.globalKey.currentState;

                      if (formState != null && formState.validateForm()) {
                        final email = formState.email;
                        final password = formState.password;

                        final request = LoginRequest(
                          email: email,
                          password: password,
                        );

                        context.read<LoginCubit>().loginUser(request);
                      }
                    },
                  ),
                  SizedBox(height: 14.h),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Or Continue With',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff51526C),
                      ),
                    ),
                  ),
                  SizedBox(height: 14.h),
                  const CustomOtherLogin(),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Are you new in Marketi ',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff51526C),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, Routes.signup);
                        },
                        child: Text(
                          'register?',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColor.kPrimaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

