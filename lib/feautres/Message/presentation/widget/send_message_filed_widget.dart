import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';
import 'package:flutter_test_chat1/core/shared/sharedPrefrances/shared_pref.dart';
import 'package:flutter_test_chat1/core/strings/text_words.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/req/request_message_model.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/cubit/getallmessagebloc/cubit/getallmessage_cubit.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/cubit/getallmessagebloc/cubit/getallmessage_state.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/cubit/getallmessagedialog/cubit/get_all_message_dialog_cubit.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/cubit/messagebloc/cubit/message_cubit.dart';

class SendMessageFiledWidget extends StatelessWidget {
  const SendMessageFiledWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //? contrllor for filed message
    TextEditingController controllerMessage = TextEditingController();
    //? my account
    int myAccount = AppSharedPreferences.getUserId();
    //?  partener id
    int partenerId = AppSharedPreferences.getPartenerId();

    return Container(
      decoration: BoxDecoration(
          color: AppColors.textColor, borderRadius: BorderRadius.circular(18)),
      child: TextField(
        onChanged: (value) {
          context.read<GetAllMessagesCubti>().changeColor(value);
        },
        controller: controllerMessage,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.sp),
            borderSide: BorderSide(
              color: AppColors.textColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.sp),
            borderSide: BorderSide(
              color: AppColors.textColor,
            ),
          ),
          hintText: TextWord.writeMessage,
          suffixIcon: BlocBuilder<GetAllMessagesCubti, GetAllMessagesState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  //! Create a message object
                  MessageRequest messageModels = MessageRequest(
                    recipientId: partenerId,
                    who: myAccount,
                    message: controllerMessage.text,
                    time: DateTime.now(),
                  );

                  //! Send the message using MessageCubit
                  context
                      .read<MessageCubit>()
                      .sendMessage(messageModel: messageModels);
                  //! Get all messages using GetAllMessagesCubit :
                  context.read<GetAllDialogMessageCubit>().getAllMessage();
                  //! this is for id and for get all message :
                  context.read<GetAllMessagesCubti>().getAllMessage();
                  controllerMessage.clear();
                },
                icon: Icon(
                  Icons.send,
                  color: state.changeColor,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
