import 'package:bookia/core/core_widgets/field.dart';
import 'package:bookia/core/helper/app_constant.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/my_app_bar.dart';
import 'package:bookia/features/passwor_changed/ui/password_changed_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Reset password"),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40.h),
              Text(
                "Your new password must be\ndifferent from previous one",
                style: TextStyle(fontFamily: AppConstant.openSans),
              ),
              SizedBox(height: 40.h),
              Field(hintText: "********", title: "Password"),
              Field(hintText: "********", title: "Confirm password"),
              SizedBox(height: 60.h),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PasswordChangedScreen(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(10.sp),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.appMainColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    "Reset password",
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
            ],
          ),
        ),
      ),
    );
  }
}
