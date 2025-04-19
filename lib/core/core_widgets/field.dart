import 'package:bookia/core/helper/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Field extends StatelessWidget {
  const Field({
    super.key,
    required this.hintText,
    required this.title,
    this.controller,
    this.validator,
  });
  final String hintText;
  final String title;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15.h),
        Text(
          title,
          style: TextStyle(
            fontFamily: AppConstant.openSans,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 15.h),
        TextFormField(
          
          validator: validator,
          controller: controller,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          onEditingComplete: () {
            FocusScope.of(context).nextFocus();
          },
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            hintStyle: TextStyle(color: Colors.grey.shade600),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
      ],
    );
  }
}
