import 'package:flutter/material.dart';
import 'package:flutter_test_chat1/core/Utils/helper/function/function_helper.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/widget/custom_divider_widget.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/widget/custom_text_nave_to_page_widget.dart';


class CustomBottomNavigationButton extends StatelessWidget {
  const CustomBottomNavigationButton({
    super.key,
    required this.subText,
    required this.textLoginOrSignUp,
    required this.routeName,
  });
  final String subText;
  final String textLoginOrSignUp;
  final String routeName;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CustomDividerWidget(),
        CustomTextNavegetToPageWidget(
          onTap: () {
            navigationPage(page: routeName, context);
          },
          subText: subText,
          textLoginOrSignUp: textLoginOrSignUp,
        ),
      ],
    );
  }
}