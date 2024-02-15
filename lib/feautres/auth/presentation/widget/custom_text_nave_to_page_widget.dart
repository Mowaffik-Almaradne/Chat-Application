import 'package:flutter/material.dart';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_family_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_size_helper.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_text_widget.dart';

class CustomTextNavegetToPageWidget extends StatelessWidget {
  const CustomTextNavegetToPageWidget({
    super.key,
    required this.onTap,
    required this.subText,
    required this.textLoginOrSignUp,
  });

  final String subText;
  final String textLoginOrSignUp;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextWidget(
          text: subText,
          fontFamily: FontFamily.fontPoppinsBold,
          fontSize: FontSize.fontVerySmall,
          color: AppColors.subColor,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            textLoginOrSignUp,
            style: TextStyle(
              fontSize: FontSize.fontSmall1,
              fontFamily: FontFamily.fontPoppinsBold,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
