import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_family_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/function/function_helper.dart';
import 'package:flutter_test_chat1/core/shared/sharedPrefrances/shared_pref.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_text_widget.dart';
import 'package:flutter_test_chat1/core/strings/text_words.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/data/model/res/partner_response_model.dart';

class InfoPartnerWidget extends StatelessWidget {
  const InfoPartnerWidget({super.key, required this.partnerInfo});
  final List<PartnerInfo> partnerInfo;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: partnerInfo.length,
      itemBuilder: (context, index) {
        //? cash id partener
        AppSharedPreferences.cachePartenerId(
          userIdPartener: partnerInfo[index].id,
        );
        //? cash useR Name partener
        AppSharedPreferences.cachePartenerName(
          userNamePartener: partnerInfo[index].userName,
        );
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: partnerInfo[index].userName,
              fontFamily: FontFamily.fontPoppinsBold,
              fontSize: 20.sp,
              color: AppColors.subColor,
            ),
            TextWidget(
              align: TextAlign.start,
              text: "${TextWord.age}: ${partnerInfo[index].age}",
              fontFamily: FontFamily.fontPoppinsMedium,
              fontSize: 16.sp,
              color: AppColors.subColor,
            ),
            TextWidget(
              align: TextAlign.start,
              text:
                  "${TextWord.cityName} :${extractCityName(partnerInfo[index].cityName)}",
              fontFamily: FontFamily.fontPoppinsMedium,
              fontSize: 12.sp,
              color: AppColors.subColor,
            ),
          ],
        );
      },
    );
  }
}
