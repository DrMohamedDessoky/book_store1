import 'package:bookia/core/helper/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MediaContainer extends StatelessWidget {
  const MediaContainer({super.key, required this.title, required this.logo});
  final String title;
  final String logo;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 60.h,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(logo, height: 20, colorFilter: null),
              SizedBox(width: 10.w),
              Text(title, style: TextStyle(fontFamily: AppConstant.openSans)),
            ],
          ),
        ),
      ),
    );
  }
}
