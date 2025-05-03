import 'package:bookia/core/helper/app_routes.dart';
import 'package:bookia/core/sevices/local_services/pref_keys.dart';
import 'package:bookia/core/sevices/local_services/shared_prefs_helper.dart';
import 'package:bookia/features/test/test_screen.dart';
import 'package:flutter/material.dart';

class CheckAuthScreen extends StatefulWidget {
  const CheckAuthScreen({super.key});

  @override
  State<CheckAuthScreen> createState() => _CheckAuthScreenState();
}

class _CheckAuthScreenState extends State<CheckAuthScreen> {
  @override
  void initState() {
    super.initState();
    checkToken();
  }

  Future<void> checkToken() async {
    await Future.delayed(Duration(seconds: 1));
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? token = prefs.getString('token');
    bool? isOpened = await SharedPrefsHelper.getData(PrefKeys.isOnBoardOpened);
    String? token = await SharedPrefsHelper.getData(PrefKeys.tokenKey);
    if (!mounted) return;

    if (token != null && token.isNotEmpty) {
      // Navigate to Test screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TestScreen()),
      );
    } else if (isOpened??false) {
      // Navigate to auth screen
      Navigator.pushReplacementNamed(context, AppRoutes.authScreen);
    } else {
      // Navigate to PageView (onboarding/login)
      Navigator.pushReplacementNamed(context, AppRoutes.pageViewScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
