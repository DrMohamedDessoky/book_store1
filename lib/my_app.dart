import 'package:bookia/features/page_view/ui/page_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) =>
       MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PageViewScreen(),
      ),
    );
  }
}