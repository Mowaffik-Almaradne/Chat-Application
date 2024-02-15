import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_family_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_size_helper.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_text_widget.dart';
import 'package:flutter_test_chat1/core/strings/text_words.dart';

class NoMessageListWidget extends StatelessWidget {
  const NoMessageListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: TextWidget(
        align: TextAlign.center,
        text: TextWord.noMessages,
        fontFamily: FontFamily.fontPoppinsBold,
        fontSize: FontSize.fontMeduimeSubText.sp,
        color: AppColors.primaryColor,
      ),
    );
  }
}
