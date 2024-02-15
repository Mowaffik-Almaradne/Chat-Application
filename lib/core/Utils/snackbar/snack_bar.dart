import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_chat1/core/Utils/helper/border/border_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_family_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/padding/padding_helper.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_text_widget.dart';


class SnackBarUtil {
  //! function snack bar
  static void showSnackBar({
    required String message,
    required BuildContext context,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.textColor,
        content: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.sp,
            vertical: 10.sp,
          ),
          //! Text Snack Bar
          child: TextWidget(
            text: message,
            fontFamily: FontFamily.fontPoppinsBold,
            fontSize: 13.sp,
            color: AppColors.borderColor,
          ), //!
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.borderColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(BorderApp.borderTextFormFiled.sp),
        ),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(
          PaddingApp.paddingSpaceBetween2.sp,
        ),
      ),
    );
  }
}
