import 'package:bookia/core/core_widgets/field.dart';
import 'package:bookia/core/helper/app_constant.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/my_app_bar.dart';
import 'package:bookia/features/enter_code/ui/enter_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Forget password"),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Text(
              "Enter your email \nto reset your password",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: AppConstant.openSans),
            ),

            Field(hintText: "Enter your email", title: "Email"),
            SizedBox(height: 50.h),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EnterCodeScreen()),
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
                  "Send code",
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
    );
  }
}
