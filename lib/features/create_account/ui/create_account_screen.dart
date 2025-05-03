import 'package:bookia/core/core_widgets/field.dart';
import 'package:bookia/core/core_widgets/media_container.dart';
import 'package:bookia/core/helper/app_constant.dart';
import 'package:bookia/core/helper/app_routes.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/my_app_bar.dart';
import 'package:bookia/features/create_account/cubit/create_account_cubit.dart';
import 'package:bookia/features/test/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool isChecked = false;
  TextEditingController namerController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    namerController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
  }

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: MyAppBar(title: "create account"),
      body: Padding(
        padding: EdgeInsets.all(8.0.w),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: BlocConsumer<CreateAccountCubit, CreateAccountState>(
            listener: (context, state) {
              debugPrint("state is $state");
              if (state is CreateAccountError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Failed to create Account"),
                    backgroundColor: AppColors.appMainColor,
                    elevation: 14,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                );
              } else if (state is CreateAccountSuccess) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => TestScreen()),
                  (route) => false,
                );
              }
            },
            builder: (context, state) {
              return Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    Field(
                      hintText: "Enter Your name",
                      title: "Name",
                      controller: namerController,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return "please enter your name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    Field(
                      hintText: "Enter your Email",
                      title: "Email",
                      controller: emailController,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return "please enter your email";
                        } else {
                          return null;
                        }
                      },
                    ),
                    Field(
                      hintText: "Enter password",
                      title: "Password",
                      controller: passwordController,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return "please enter your password";
                        } else {
                          return null;
                        }
                      },
                    ),
                    Field(
                      hintText: "Confirm password",
                      title: "Confirm password",
                      controller: confirmPassController,
                      validator: (v) {
                        if (v == null ||
                            v.isEmpty ||
                            confirmPassController.text !=
                                passwordController.text) {
                          return "Confirmation password must be same as password";
                        } else {
                          return null;
                        }
                      },
                    ),
                    FormField(
                      initialValue: isChecked,
                      validator: (value) {
                        if (value != true) {
                          return "Please agree with terms & conditions";
                        } else {
                          return null;
                        }
                      },

                      builder: (FormFieldState state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                      state.didChange(value);
                                      debugPrint("isChecked : $isChecked");
                                    });
                                  },
                                ),
                                Text(
                                  "Agree with ",
                                  style: TextStyle(
                                    fontFamily: AppConstant.openSans,
                                    fontSize: 13.sp,
                                  ),
                                ),
                                Text(
                                  "terms & conditions",
                                  style: TextStyle(
                                    color: AppColors.appMainColor,
                                    fontFamily: AppConstant.openSans,
                                  ),
                                ),
                              ],
                            ),
                            if (state.hasError)
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(
                                  state.errorText ?? "",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                          ],
                        );
                      },
                    ),

                    SizedBox(height: 10.h),
                    GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          context.read<CreateAccountCubit>().createAccount(
                            name: namerController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            confirmPassword: confirmPassController.text,
                          );
                          
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(10.sp),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.appMainColor,
                          borderRadius: BorderRadius.circular(10.r),
                        ),

                        child: Text(
                          "Create account",
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

                    if (state is CreateAccountLoading) ...[
                      SizedBox(height: 4.h),
                      LinearProgressIndicator(),
                    ],

                    SizedBox(height: 10.h),
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
                    SizedBox(height: 10.h),
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
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(fontFamily: AppConstant.openSans),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
                          },
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                              color: AppColors.appMainColor,
                              fontFamily: AppConstant.openSans,
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
