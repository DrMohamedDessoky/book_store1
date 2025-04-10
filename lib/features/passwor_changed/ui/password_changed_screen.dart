import 'package:bookia/core/helper/app_constant.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: ""),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(
                "assets/images/done.png",
                height: 100.h,
                width: 100.w,
              ),
              SizedBox(height: 40.h),
              Text(
                "Password changed!",
                style: TextStyle(
                  fontFamily: AppConstant.openSans,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 25.h),
              Text(
                "Your password has been\nchanged successfully",
                style: TextStyle(
                  fontFamily: AppConstant.openSans,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.all(10.sp),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.appMainColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  "Finished!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.appWhiteColor,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppConstant.openSans,
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
