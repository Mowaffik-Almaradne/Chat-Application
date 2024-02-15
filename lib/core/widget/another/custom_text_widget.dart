// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWidget extends StatelessWidget {
  TextWidget({
    super.key,
    required this.text,
    required this.fontFamily,
    required this.fontSize,
    required this.color,
    this.align,
  });

  final String text;
  final String fontFamily;
  final double fontSize;
  final Color color;
  TextAlign? align;
  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      textAlign: TextAlign.center,
      text,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize.sp,
        color: color,
      ),
    );
  }
}
