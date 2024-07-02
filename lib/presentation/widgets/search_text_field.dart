import 'package:flutter/material.dart';
import 'package:flutter_sample_bloc_pattern/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: false,
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primaryColor, width: 1.2),
          borderRadius: BorderRadius.circular(30.r),
        ),
        contentPadding: EdgeInsets.all(16.h),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Icon(
            Icons.search,
            size: 35.sp,
            color: primaryColor.withOpacity(0.75),
          ),
        ),
        hintStyle: TextStyle(
          color: secondaryColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
        ),
        hintText: 'What do you search for ?',
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primaryColor, width: 1.2),
          borderRadius: BorderRadius.circular(30.r),
        ),
      ),
    );
  }
}
