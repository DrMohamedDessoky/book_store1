import 'package:bookia/core/helper/app_constant.dart';
import 'package:bookia/core/sevices/local_services/pref_keys.dart';
import 'package:bookia/core/sevices/local_services/shared_prefs_helper.dart';
import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/features/auth/ui/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test Scteen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You ara logged in !!",
              style: TextStyle(
                fontSize: 20.sp,
                color: AppColors.appMainColor,
                fontFamily: AppConstant.openSans,
              ),
            ),
            TextButton(
              onPressed: () async {
                await SharedPrefsHelper.removeData(PrefKeys.tokenKey);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => AuthScreen()),
                  (route) => false,
                );
              },
              child: Column(children: [Text("logOut")]),
            ),
          ],
        ),
      ),
    );
  }
}
