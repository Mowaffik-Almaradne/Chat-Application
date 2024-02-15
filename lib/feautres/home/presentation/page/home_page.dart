import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_app_bar_widget.dart';
import 'package:flutter_test_chat1/core/strings/image.dart';
import 'package:flutter_test_chat1/core/strings/text_words.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(text: TextWord.home),
        Container(
          width: 500.w,
          height: 600.h,
          decoration: BoxDecoration(
            color: AppColors.backGroundColor,
            image: const DecorationImage(
              image: AssetImage(
                PathImageApp.backgroundImageHome,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


///CustomAppBar(text: TextWord.home),