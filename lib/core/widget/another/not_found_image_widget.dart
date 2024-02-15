import 'package:flutter/material.dart';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';
import 'package:flutter_test_chat1/core/strings/image.dart';

class NotFoundImageWidget extends StatelessWidget {
  const NotFoundImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 116,
      height: 116,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: AppColors.subColor, width: 2),
      ),
      child: Image.asset(
        PathImageApp.notFoundImage,
        width: 116,
        height: 116,
        fit: BoxFit.cover,
      ),
    );
  }
}
