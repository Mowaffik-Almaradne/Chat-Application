import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_family_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_size_helper.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_text_widget.dart';
import 'package:flutter_test_chat1/core/strings/image.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.text,
    this.onBack,
  }) : super(key: key);
  final String text;
  final Function()? onBack;
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: TextWidget(
        text: text,
        fontFamily: FontFamily.fontPoppinsBold,
        fontSize: FontSize.fontMeduime,
        color: AppColors.textColor,
      ),
      leading: onBack != null
          ? IconButton(
              icon: SvgPicture.asset(PathImageApp.arrowBack),
              onPressed: onBack,
            )
          : null,
          
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55.sp);
}
