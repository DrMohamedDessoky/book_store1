import 'package:bookia/core/helper/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.title});
  @override
  Size get preferredSize => Size.fromHeight(80.h);
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios_new),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 17,
          fontFamily: AppConstant.openSans,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
