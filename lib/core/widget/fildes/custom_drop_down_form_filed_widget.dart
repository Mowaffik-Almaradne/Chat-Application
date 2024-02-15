import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_test_chat1/core/Utils/helper/border/border_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_family_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_size_helper.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_text_widget.dart';
import 'package:flutter_test_chat1/core/strings/image.dart';


class DropDownFormFiledWidget extends StatelessWidget {
  const DropDownFormFiledWidget({
    Key? key,
    required this.hintText,
    required this.items,
    required this.onChanged,
    required this.validator,
  }) : super(key: key);

  final String hintText;
  final List<CustomDropdownItem> items;
  final void Function(int?) onChanged;
  final String? Function(int?) validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 12.r,
        left: 20.r,
        right: 1.5.r,
      ),
      child: DropdownButtonFormField2<int>(
        isExpanded: true,
        alignment: Alignment.centerLeft,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: 23.h,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(BorderApp.borderTextFormFiled),
            borderSide: BorderSide(
              color: AppColors.subColor,
              width: 2.8.w,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(BorderApp.borderTextFormFiled),
            borderSide: BorderSide(
              color: AppColors.subColor,
              width: 2.8.w,
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
        hint: Text(
          hintText,
          overflow: TextOverflow.visible,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: FontSize.fontSmall1,
            fontFamily: FontFamily.fontPoppinsMedium,
          ),
        ),
        items: items
            .map(
              (item) => DropdownMenuItem<int>(
                value: item.value,
                child: TextWidget(
                  text: item.item,
                  fontFamily: FontFamily.fontPoppinsBold,
                  fontSize: FontSize.fontSmall1,
                  color: AppColors.subColor,
                ),
              ),
            )
            .toList(),
        onChanged: onChanged,
        validator: validator,
        buttonStyleData: ButtonStyleData(
          padding: EdgeInsets.only(
            right: 34.r,
          ),
        ),
        iconStyleData: IconStyleData(
          icon: Padding(
            padding: EdgeInsets.only(top: 15.r),
            child: SvgPicture.asset(
              PathImageApp.iconDropDownFormFiled,
            ),
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 170.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15).w,
            border: Border.all(
              color: AppColors.subColor,
              width: 2,
            ),
          ),
          offset: Offset(2.w, 5.h),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40).w,
            thickness: MaterialStateProperty.all(6),
            thumbVisibility: MaterialStateProperty.all(true),
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: 45.h,
          padding: EdgeInsets.symmetric(horizontal: 15.r),
        ),
      ),
    );
  }
}

class CustomDropdownItem {
  CustomDropdownItem({required this.value, required this.item});
  final int value;
  final String item;
}
