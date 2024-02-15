import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_family_helper.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_text_widget.dart';

class ReciverMessageStyleWidget extends StatelessWidget {
  const ReciverMessageStyleWidget({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.sp),
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 9.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18.sp),
            topRight: Radius.circular(16.sp),
            bottomLeft: Radius.circular(16.sp),
          ),
          color: AppColors.textColor,
        ),
        child: TextWidget(
          align: TextAlign.right,
          text: message,
          fontFamily: FontFamily.fontPoppinsMedium,
          fontSize: 19.sp,
          color: AppColors.subColor,
        ),
      ),
    );
  }
}
