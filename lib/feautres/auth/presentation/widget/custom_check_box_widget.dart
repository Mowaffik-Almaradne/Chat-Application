import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_size_helper.dart';
class CustomCheckBoxWidget extends StatelessWidget {
  CustomCheckBoxWidget({
    super.key,
    required this.subTextOne,
    this.subTextTwo,
    required this.onChanged,
    required this.value,
    required this.textColor,
  });
  final String subTextOne;
  final String? subTextTwo;
  final bool value;
  final Color textColor;
  final void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 14.sp,
      ),
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primaryColor,
            tristate: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Text.rich(
            style: TextStyle(color: textColor),
            TextSpan(
              text: subTextOne,
              style: TextStyle(
                fontSize: FontSize.fontSmall1,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: subTextTwo,
                  style: TextStyle(
                    fontSize: FontSize.fontSmall1,
                    decoration: TextDecoration.underline,
                    decorationThickness: 2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
