import 'package:bookia/core/sevices/local_services/pref_keys.dart';
import 'package:bookia/core/sevices/local_services/shared_prefs_helper.dart';
import 'package:bookia/features/auth/ui/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  PageController controller = PageController(initialPage: 0);
  double currentPage = 0;
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPage = controller.page ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                SharedPrefsHelper.saveData(
                  key: PrefKeys.isOnBoardOpened,
                  value: true,
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AuthScreen()),
                );
              },
              child: Text("Skip"),
            ),
            Expanded(
              child: PageView(
                controller: controller,
                children: [
                  Image.network(
                    "https://img.freepik.com/free-vector/hand-drawn-flat-design-stack-books-illustration_23-2149341898.jpg",
                  ),
                  Image.network(
                    "https://img.freepik.com/free-vector/hand-drawn-flat-design-stack-books-illustration_23-2149341898.jpg",
                  ),
                  Image.network(
                    "https://img.freepik.com/free-vector/hand-drawn-flat-design-stack-books-illustration_23-2149341898.jpg",
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,

                  effect: ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 10,
                    radius: 8,
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (controller.page! < 2) {
                      controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOutCubic,
                      );
                    } else {
                      SharedPrefsHelper.saveData(
                        key: PrefKeys.isOnBoardOpened,
                        value: true,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AuthScreen()),
                      );
                    }
                  },
                  child: CircleAvatar(
                    radius: 28.r,
                    child:
                        currentPage < 2
                            ? Icon(Icons.arrow_forward_sharp)
                            : Text("Next", style: TextStyle(fontSize: 14.sp)),
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
