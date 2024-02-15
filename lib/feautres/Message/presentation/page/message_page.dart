import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_chat1/core/shared/bloc/viewbloc/cubit/view_cubit.dart';
import 'package:flutter_test_chat1/core/shared/bloc/viewbloc/cubit/view_state.dart';
import 'package:flutter_test_chat1/core/enum/view_page_enum.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/view/send_message_view.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/view/show_message_view.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewCubit, ViewState>(
      builder: (context, state) {
        return buildBody(state.changeView);
      },
    );
  }

//! function to swip pages :
  Widget buildBody(ViewPageChange viewPageState) {
    switch (viewPageState) {
      case ViewPageChange.sendMessage:
        return const SendMessageView();
      case ViewPageChange.other:
        return const SendMessageView();
      case ViewPageChange.showMessage:
        return const ShowMessageView();
      default:
        return const ShowMessageView();
    }
  }
}
