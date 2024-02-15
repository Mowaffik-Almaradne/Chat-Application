// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_chat1/core/Utils/helper/border/border_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_family_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_size_helper.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_text_widget.dart';
class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onPreesed,
    this.sideColor,
    this.width,
    this.icon,
  });

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPreesed;
  Color? sideColor;
  double? width;
  String? icon;

  @override
  Widget build(BuildContext context) {
    //! Button All App
    return Container(
      width: 300.w,
      height: 70.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            offset: const Offset(0, 0),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPreesed,
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(BorderApp.borderElevatedButtonRaduise),
            side: BorderSide(
              width: width ?? 0,
              color: sideColor ?? AppColors.transparentColor,
            ),
          ),
          backgroundColor: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
              text: text,
              fontFamily: FontFamily.fontPoppinsBold,
              fontSize: FontSize.fontMeduime,
              color: textColor,
            ),
            //! if is icon Visibility
            Padding(
              padding: EdgeInsets.only(left: 8.r),
              child: Visibility(
                visible: icon != null,
                child: SvgPicture.asset(
                  icon ?? '',
                  width: 24.w,
                  height: 24.h,
                ),
              ),
            ),
            //!
          ],
        ),
      ),
    );
  }
}
