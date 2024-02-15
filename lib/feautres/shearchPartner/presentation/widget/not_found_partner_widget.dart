import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_family_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_size_helper.dart';
import 'package:flutter_test_chat1/core/shared/bloc/viewbloc/cubit/view_cubit.dart';
import 'package:flutter_test_chat1/core/enum/view_page_enum.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_text_widget.dart';
import 'package:flutter_test_chat1/core/strings/text_words.dart';

class NotFoundPartenerWidget extends StatefulWidget {
  const NotFoundPartenerWidget({Key? key}) : super(key: key);

  @override
  State<NotFoundPartenerWidget> createState() => _NotFoundPartenerWidgetState();
}

class _NotFoundPartenerWidgetState extends State<NotFoundPartenerWidget> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      context.read<ViewCubit>().changeViewPage(ViewPageChange.searchPartner);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: Container(
          alignment: Alignment.center,
          width: 380.w,
          height: 120,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            boxShadow: [
              BoxShadow(
                color: AppColors.toggleColor,
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 4),
              ),
            ],
            borderRadius: BorderRadius.circular(22).r,
          ),
          child: TextWidget(
            align: TextAlign.center,
            text: TextWord.partnerMessage,
            fontFamily: FontFamily.fontPoppinsBold,
            fontSize: FontSize.fontMeduimeSubText,
            color: AppColors.textColor,
          ),
        ),
      ),
    );
  }
}
