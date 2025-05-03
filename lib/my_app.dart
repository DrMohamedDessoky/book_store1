import 'package:bookia/core/helper/app_routes_map.dart';
import 'package:bookia/features/check_auth/check_auth_screen.dart';
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
      builder:
          (_, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: 
             AppRoutesMap.routeMap, 
            home: CheckAuthScreen(),
          ),
    );
  }
}
