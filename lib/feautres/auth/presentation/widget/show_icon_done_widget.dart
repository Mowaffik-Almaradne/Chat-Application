import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_chat1/core/strings/image.dart';


class ShowIconDoneWidget extends StatelessWidget {
  const ShowIconDoneWidget({
    super.key,
    required this.visible,
  });
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 18.sp, bottom: 10.sp, left: 9.sp),
      child: Visibility(
        visible: visible,
        replacement: SizedBox(width: 18.sp, height: 14.sp),
        child: Image.asset(PathImageApp.iconeDoneFilde),
      ),
    );
  }
}
