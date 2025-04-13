import 'package:bookia/core/core_widgets/field.dart';
import 'package:bookia/core/core_widgets/media_container.dart';
import 'package:bookia/core/helper/app_constant.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: MyAppBar(title: "create account"),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
 
            children: [
              Field(hintText: "Enter Your name", title: "Name"),
              Field(hintText: "Enter your Email", title: "Email"),
              Field(hintText: "Enter passworf", title: "Password"),
              Field(hintText: "Confirm password", title: "Confirm password"),
              Row(
                children: [
                  Checkbox(
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          
                    activeColor: AppColors.appMainColor,
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
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
              SizedBox(height: 10.h),
              Container(
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
                  Text(
                    "Sign in",
                    style: TextStyle(
                      color: AppColors.appMainColor,
                      fontFamily: AppConstant.openSans,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
