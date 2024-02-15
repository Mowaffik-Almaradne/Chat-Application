// ignore_for_file: must_be_immutable
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';

class CustomImageWidget extends StatelessWidget {
  CustomImageWidget({super.key, required this.visible, required this.image});
  bool visible;
  String image;
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
      child: Visibility(
        replacement: Image.asset(
          'assets/images/Png/image.png',
        ),
        visible: visible,
        child: Image.memory(
          base64Decode(image),
          width: 116,
          height: 116,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
