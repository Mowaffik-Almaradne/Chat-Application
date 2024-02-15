import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Divider(
              color: AppColors.primaryColor,
              thickness: 3,
              indent: 5.sp, // Adjust the left indentation as needed
              endIndent: 5.sp,
            ),
          ),
        ],
      ),
    );
  }
}
