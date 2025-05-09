import 'package:bookia/core/helper/app_constant.dart';
import 'package:bookia/core/helper/app_routes.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/my_app_bar.dart';
import 'package:bookia/core/core_widgets/field.dart';
import 'package:bookia/core/core_widgets/media_container.dart';
import 'package:bookia/features/forget_password/ui/forget_password_screen.dart';
import 'package:bookia/features/login/cubit/login_cubit.dart';
import 'package:bookia/features/test/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Login"),

      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              debugPrint("state is $state");
            },
            builder: (context, state) {
              return Form(
                key: formkey,
                child: Column(
                  children: [
                    Field(
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return "Please Enter your email";
                        } else {
                          return null;
                        }
                      },
                      hintText: "Enter Your Name",
                      title: "Email",
                      controller: emailController,
                    ),
                    Field(
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return "Please Enter your password";
                        } else {
                          return null;
                        }
                      },
                      hintText: "Enter Your Password",
                      title: "Password",
                      controller: passwordController,
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      children: [
                        Checkbox(
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,

                          activeColor: AppColors.appMainColor,
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        Expanded(
                          child: Text(
                            "Remember Me",
                            style: TextStyle(
                              fontFamily: AppConstant.openSans,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgetPasswordScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Forgot Your password?",
                            style: TextStyle(
                              color: AppColors.appMainColor,
                              fontFamily: AppConstant.openSans,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    Container(
                      padding: EdgeInsets.all(10.sp),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.appMainColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: InkWell(
                        onTap: () {
                          if (formkey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TestScreen(),
                              ),
                            );
                          }
                        },
                        child: Text(
                          "Login",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.appWhiteColor,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: AppConstant.openSans,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(color: Colors.black),

                            height: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Text("Or login with"),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(color: Colors.black),

                            height: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        MediaContainer(
                          title: "Google",
                          logo: "assets/images/google3.svg",
                        ),
                        SizedBox(width: 30.w),
                        MediaContainer(
                          title: "Facebook",
                          logo: "assets/images/facebook.svg",
                        ),
                      ],
                    ),
                    SizedBox(height: 50.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Dont't have an account?  ",
                          style: TextStyle(fontFamily: AppConstant.openSans),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.createAccoutScreen,
                            );
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              color: AppColors.appMainColor,
                              fontFamily: AppConstant.openSans,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
