// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_chat1/core/Utils/helper/border/border_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_family_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_size_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/icon/icon_helper.dart';

class CoustomTextFiledWidget extends StatelessWidget {
  CoustomTextFiledWidget({
    super.key,
    required this.hintText,
    required this.onChange,
    required this.textInputType,
    this.validator,
    this.suffixIcon,
    this.onTap,
    this.onFieldSubmitted,
    this.inputFormatter,
    this.obscureText,
    this.colorsuffixIcon,
    this.onPressed,
    this.controller,
    this.iconDone,
  });
  final String hintText;
  final TextInputType textInputType;
  final Function(String) onChange;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Color? colorsuffixIcon;
  final String? suffixIcon;
  final bool? obscureText;
  final IconData? iconDone;
  final List<TextInputFormatter>? inputFormatter;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 12.r,
        left: 20.r,
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText ?? false,
        obscuringCharacter: '*',
        textInputAction: TextInputAction.next,
        inputFormatters: inputFormatter,
        keyboardType: textInputType,
        decoration: InputDecoration(
          //!  suffixIcon
          suffixIcon: SizedBox(
            height: IconSizeApp.sizeIconTextFormFiledH.sp,
            child: suffixIcon != null
                ? Padding(
                    padding: EdgeInsets.only(right: 15.sp),
                    child: IconButton(
                      icon: SvgPicture.asset(
                        suffixIcon!,
                        width: 20.sp,
                        color: colorsuffixIcon,
                      ),
                      onPressed: onPressed,
                    ),
                  )
                : SizedBox(
                    height: IconSizeApp.sizeIconTextFormFiledH.sp,
                    width: IconSizeApp.sizeIconTextFormFiledW.sp,
                  ),
          ),
          //!
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 14.w,
            vertical: 19.h,
          ),
          hintStyle: TextStyle(
            fontSize: FontSize.fontSmall1.sp,
            fontFamily: FontFamily.fontPoppinsMedium,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(BorderApp.borderTextFormFiled),
            borderSide: BorderSide(
              color: AppColors.subColor,
              width: 2.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(BorderApp.borderTextFormFiled),
            borderSide: BorderSide(
              color: AppColors.subColor,
              width: 2.5,
            ),
          ),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.borderColor,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(BorderApp.borderTextFormFiled),
              )),

          errorStyle: TextStyle(
            fontFamily: FontFamily.fontPoppinsBold,
            fontSize: 12.sp,
            color: AppColors.borderColor,
          ),
        ),
        onChanged: onChange,
        validator: validator,
        onFieldSubmitted: onFieldSubmitted,
        onTap: onTap,
      ),
    );
  }
}
