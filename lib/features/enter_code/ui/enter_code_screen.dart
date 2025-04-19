import 'package:bookia/core/helper/app_constant.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/my_app_bar.dart';
import 'package:bookia/features/reset_password/ui/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnterCodeScreen extends StatelessWidget {
  const EnterCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Enter code"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Enter 4 digits that you recieved on your email"),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 50.w,
                  child: TextField(
                    onChanged: (value) {
                      if (value.length == 1 && index < 3) {
                        FocusScope.of(context).nextFocus();
                      } else if (value.isEmpty && index > 0) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                  ),
                );
              }),
            ),
            SizedBox(height: 40.h),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResetPasswordScreen(),
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
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Didn't recieve a code ? "),
                Text(
                  "Send again",
                  style: TextStyle(
                    fontFamily: AppConstant.openSans,
                    color: AppColors.appMainColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
