import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tu_kar/utils/constants/app_colors.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 0.85.sw,
      height: 0.06.sh,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        // boxShadow: const [
        //   BoxShadow(
        //     color: AppColors.greyColor,
        //     offset: Offset(0, -4),
        //     blurRadius: 4,
        //     spreadRadius: 0,
        //   ),
        //   BoxShadow(
        //     color: AppColors.greyColor,
        //     offset: Offset(0, 4),
        //     blurRadius: 4,
        //     spreadRadius: 0,
        //   ),
        // ],
      ),
      child: const TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
          hintText: "Search", // Placeholder text
          border: InputBorder.none, // Remove underline
          suffixIcon: Icon(Icons.search_outlined), // Search icon at the end
        ),
      ),
    );
  }
}
