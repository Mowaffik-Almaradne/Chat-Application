// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_family_helper.dart';
import 'package:flutter_test_chat1/core/shared/bloc/navigationbuttoncubit/navigation_button_cubit.dart';
import 'package:flutter_test_chat1/core/shared/bloc/viewbloc/cubit/view_cubit.dart';
import 'package:flutter_test_chat1/core/shared/bloc/viewbloc/cubit/view_state.dart';
import 'package:flutter_test_chat1/core/enum/view_page_enum.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_text_widget.dart';
import 'package:flutter_test_chat1/core/strings/image.dart';
import 'package:flutter_test_chat1/core/strings/text_words.dart';

class CustomButtonPartnerWidget extends StatelessWidget {
  const CustomButtonPartnerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //! buuton for message
    return BlocBuilder<ViewCubit, ViewState>(
      builder: (context, state) {
        return SizedBox(
          height: 30,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 1.r,
                  horizontal: 80.r,
                )),
            onPressed: () {
              context.read<ViewCubit>().changeViewPage(ViewPageChange.other);
              context.read<AllPagesCubit>().changeButton(2);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 21.r),
                  child: SvgPicture.asset(
                    PathImageApp.meesageICon,
                    width: 17.sp,
                    color: AppColors.textColor,
                  ),
                ),
                TextWidget(
                  align: TextAlign.center,
                  text: TextWord.sendMessage,
                  fontFamily: FontFamily.fontPoppinsMedium,
                  fontSize: 16.sp,
                  color: AppColors.textColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
