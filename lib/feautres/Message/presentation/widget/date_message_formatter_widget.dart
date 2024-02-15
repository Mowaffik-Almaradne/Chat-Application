import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_family_helper.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_text_widget.dart';

class DateMessageFormatterWidget extends StatelessWidget {
  const DateMessageFormatterWidget({
    super.key,
    required this.day,
    required this.month,
    required this.year,
  });
  final String day;
  final String month;
  final String year;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextWidget(
          text: '$day/',
          fontFamily: FontFamily.fontPoppinsRegular,
          fontSize: 10.sp,
          color: AppColors.toggleColor,
        ),
        TextWidget(
          text: '$month/',
          fontFamily: FontFamily.fontPoppinsRegular,
          fontSize: 10.sp,
          color: AppColors.toggleColor,
        ),
        TextWidget(
          text: year,
          fontFamily: FontFamily.fontPoppinsRegular,
          fontSize: 10.sp,
          color: AppColors.toggleColor,
        ),
      ],
    );
  }
}
