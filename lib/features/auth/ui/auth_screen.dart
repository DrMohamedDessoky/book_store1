import 'package:bookia/core/helper/app_constant.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/features/create_account/ui/create_account_screen.dart';
import 'package:bookia/features/login/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset("assets/images/splash.png").image,
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(color: Colors.transparent.withAlpha(180)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.menu_book_outlined,
                    color: Colors.white,
                    size: 40.sp,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    "Book shop",
                    style: TextStyle(
                      fontSize: 35.sp,
                      color: AppColors.appWhiteColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 29.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
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
              ),

              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateAccountScreen(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.sp),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.appWhiteColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      "Creat Account",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.appMainColor,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppConstant.openSans,
                      ),
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
