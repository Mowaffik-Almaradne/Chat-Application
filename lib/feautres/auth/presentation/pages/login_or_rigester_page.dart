import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_chat1/core/Utils/helper/border/border_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_family_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_size_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/function/function_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/padding/padding_helper.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_elevated_button_widget.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_text_widget.dart';
import 'package:flutter_test_chat1/core/strings/image.dart';
import 'package:flutter_test_chat1/core/strings/text_words.dart';
import 'package:flutter_test_chat1/core/theme/them_app.dart';
import 'package:flutter_test_chat1/router/app_router.dart';


class LoginOrRigesterPage extends StatelessWidget {
  const LoginOrRigesterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
        
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(PathImageApp.backgroundImageAll),
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 24.r,
                ),
                child: TextWidget(
                  text: TextWord.loginOrRegister,
                  color: AppColors.subColor,
                  fontSize: FontSize.fontMeduimeSubText,
                  fontFamily: FontFamily.fontPoppinsBold,
                ),
              ),
              //! button for move page login
              CustomElevatedButton(
                onPreesed: () {
                  navigationPage(
                    context,
                    page: RouteNamedScreens.loginScreenNameRoute,
                  );
                },
                text: TextWord.login,
                backgroundColor: AppColors.primaryColor,
                textColor: subTextColor,
              ),

              //! button for move page signUp
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: PaddingApp.paddingSpaceBetween2,
                ),
                child: CustomElevatedButton(
                  onPreesed: () {
                    navigationPage(
                      context,
                      page: RouteNamedScreens.signUpScreenNameRoute,
                    );
                  },
                  text: TextWord.signUp,
                  backgroundColor: AppColors.textColor,
                  textColor: AppColors.primaryColor,
                  sideColor: AppColors.primaryColor,
                  width: BorderApp.borderElevatedButton,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
