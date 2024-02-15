import 'package:flutter/material.dart';
import 'package:flutter_test_chat1/core/shared/sharedPrefrances/shared_pref.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/res/response_get_all_dialog.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/widget/reciver_message_style_widget.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/widget/sender_message_style_widget.dart';

class ListMessageWidget extends StatelessWidget {
  const ListMessageWidget({super.key, required this.messageList});
  final List<DialogMessageInfoPartener> messageList;

  @override
  Widget build(BuildContext context) {
    int myAccount = AppSharedPreferences.getUserId();
    return ListView.separated(
      reverse: true,
      separatorBuilder: (context, index) => const SizedBox(height: 1),
      itemBuilder: (context, index) {
        final reversedIndex = messageList.length - 1 - index;

        return Visibility(
          replacement: ReciverMessageStyleWidget(
            message: messageList[reversedIndex].message,
          ),
          visible: (myAccount == messageList[reversedIndex].who),
          child: SenderMessageStyleWidget(
            message: messageList[reversedIndex].message,
          ),
        );
      },
      itemCount: messageList.length,
    );
  }
}
