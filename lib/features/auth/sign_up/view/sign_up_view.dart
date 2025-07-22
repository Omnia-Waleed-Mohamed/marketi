
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marketi/core/constant/color.dart';
import 'package:marketi/core/helper/app_regex.dart';
import 'package:marketi/core/widget/custom_arrow_back.dart';
import 'package:marketi/core/widget/custom_buttom.dart';
import 'package:marketi/core/widget/custom_text_field.dart';
import 'package:marketi/features/auth/login/view/widget/custom_other_login.dart';
import 'package:marketi/features/auth/sign_up/data/model/sign_up_model.dart';
import 'package:marketi/features/auth/sign_up/data/repo/sign_up_repo.dart';
import 'package:marketi/features/auth/sign_up/view_model/sign_up_cubit.dart';
import 'package:marketi/features/auth/sign_up/view_model/sign_up_state.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SiState();
}

class _SiState extends State<SignUpView> {
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacter = false;
  bool hasNumber = false;
  bool hasMinLenght = false;
  bool isPasswordObscureText = false;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    passwordControllerListner();
  }

  void passwordControllerListner() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacter = AppRegex.hasSpecialCharacter(passwordController.text);
        hasMinLenght = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpCubit(SignUpRepository()),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 22.w),
            child: BlocConsumer<SignUpCubit, SignUpState>(
              listener: (context, state) {
                if (state is SignUpSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Signed up successfully')),
                  );
                  Navigator.pushReplacementNamed(context, '/home');
                } else if (state is SignUpFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              builder: (context, state) {
                final cubit = context.read<SignUpCubit>();

                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomArrowBack(),
                        SizedBox(width: 16.w),
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
                      controller: nameController,
                      hintText: 'Full Name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter a valid name ';
                        }
                      },
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(top: 12, left: 14, bottom: 14),
                        child: const FaIcon(FontAwesomeIcons.userPen, size: 16),
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
                      controller: phoneController,
                      hintText: '+20 1501142409',
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !AppRegex.isPhoneNumberValid(value)) {
                          return 'please enter a valid phone ';
                        }
                      },
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(top: 12, left: 14, bottom: 14),
                        child: const FaIcon(FontAwesomeIcons.mobileScreenButton, size: 16),
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
                      controller: emailController,
                      hintText: 'You@gmail.com ',
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !AppRegex.isEmailValid(value)) {
                          return 'please enter a valid email ';
                        }
                      },
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(top: 12, left: 14, bottom: 14),
                        child: const FaIcon(FontAwesomeIcons.envelope, size: 16),
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
                      controller: passwordController,
                      hintText: 'Password',
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !AppRegex.isPasswordValid(value)) {
                          return 'please enter a valid password ';
                        }
                      },
                      prefixIcon: const Icon(Icons.lock_outline_rounded, size: 18),
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
                      controller: confirmPasswordController,
                      hintText: 'Confirm Password',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter a valid password ';
                        }
                      },
                      prefixIcon: const Icon(Icons.lock_outline_rounded, size: 18),
                    ),
                    SizedBox(height: 12.h),
                    CustomButtom(
                      text: state is SignUpLoading ? 'Loading...' : 'Sign Up',
                      onPressed: () {
                        final request = SignUpRequest(
                          name: nameController.text.trim(),
                          phone: phoneController.text.trim(),
                          email: emailController.text.trim(),
                          password: passwordController.text,
                          confirmPassword: confirmPasswordController.text,
                        );

                        cubit.registerUser(request);
                      },
                    ),
                    SizedBox(height: 12.h),
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
                    SizedBox(height: 12.h),
                    const CustomOtherLogin(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
