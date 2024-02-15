import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_family_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_size_helper.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_text_widget.dart';

class CustomAgeWidget extends StatelessWidget {
  const CustomAgeWidget({
    super.key,
    required this.text,
    required this.textFormWidget,
  });
  final String text;
  final Widget textFormWidget;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 20.sp,
            bottom: 14.sp,
          ),
          child: TextWidget(
            text: text,
            fontFamily: FontFamily.fontPoppinsBold,
            fontSize: FontSize.fontMeduime,
            color: AppColors.subColor,
          ),
        ),
        Expanded(
          child: textFormWidget,
        ),
      ],
    );
  }
}
