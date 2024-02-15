import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_chat1/core/enum/status_enum.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_app_bar_widget.dart';
import 'package:flutter_test_chat1/core/strings/text_words.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/cubit/getallmessagebloc/cubit/getallmessage_cubit.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/cubit/getallmessagebloc/cubit/getallmessage_state.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/widget/message_info_widget.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/widget/no_message_list_widget.dart';

class ShowMessageView extends StatelessWidget {
  const ShowMessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(text: TextWord.messages),
        Expanded(
          child: BlocBuilder<GetAllMessagesCubti, GetAllMessagesState>(
            builder: (context, state) {
              if (state.status == StatusCubit.loading) {
                return Center(child: CircularProgressIndicator());
              } else if (state.status == StatusCubit.done) {
                return RefreshIndicator(
                  onRefresh: () =>
                      context.read<GetAllMessagesCubti>().getAllMessage(),
                  child: MessageinfoWidget(
                    messageInfo: state.listMessage,
                  ),
                );
              }
              return NoMessageListWidget();
            },
          ),
        ),
      ],
    );
  }
}

