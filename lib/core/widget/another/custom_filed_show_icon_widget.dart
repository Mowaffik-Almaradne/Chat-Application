
import 'package:flutter/material.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/widget/show_icon_done_widget.dart';


class CustomShowIconFiled extends StatelessWidget {
  const CustomShowIconFiled({
    super.key,
    required this.coustomTextFiledWidget,
    required this.visible,
  });
  final Widget coustomTextFiledWidget;
  final bool visible;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: coustomTextFiledWidget,
        ),
        ShowIconDoneWidget(
          visible: visible,
        ),
      ],
    );
  }
}
