import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_family_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_size_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/function/function_helper.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_elevated_button_widget.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_text_widget.dart';
import 'package:flutter_test_chat1/core/strings/text_words.dart';
import 'package:flutter_test_chat1/router/app_router.dart';

class CustomShowDialog {
  static void customShowDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20.sp),
                child: TextWidget(
                  text: TextWord.signinDialog,
                  fontFamily: FontFamily.fontPoppinsBold,
                  fontSize: FontSize.fontMeduimeSubText,
                  color: AppColors.subColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.sp),
                child: TextWidget(
                  align: TextAlign.center,
                  text: TextWord.wordsDialog,
                  fontFamily: FontFamily.fontPoppinsMedium,
                  fontSize: FontSize.fontMeduimeSubText,
                  color: AppColors.subColor,
                ),
              ),
              CustomElevatedButton(
                text: TextWord.done,
                backgroundColor: AppColors.primaryColor,
                textColor: AppColors.textColor,
                sideColor: AppColors.primaryColor,
                onPreesed: () {
                  navigationPage(
                    context,
                    page: RouteNamedScreens.loginScreenNameRoute,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
