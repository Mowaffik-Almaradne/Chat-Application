import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/padding/padding_helper.dart';
import 'package:flutter_test_chat1/core/shared/bloc/viewbloc/cubit/view_cubit.dart';
import 'package:flutter_test_chat1/core/shared/bloc/viewbloc/cubit/view_state.dart';
import 'package:flutter_test_chat1/core/enum/status_enum.dart';
import 'package:flutter_test_chat1/core/enum/view_page_enum.dart';
import 'package:flutter_test_chat1/core/shared/sharedPrefrances/shared_pref.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_app_bar_widget.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/cubit/getallmessagedialog/cubit/get_all_message_dialog_cubit.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/cubit/getallmessagedialog/cubit/get_all_message_dialog_state.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/widget/send_message_filed_widget.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/widget/list_message_widget.dart';

class SendMessageView extends StatelessWidget {
  const SendMessageView({super.key});
  @override
  Widget build(BuildContext context) {
    String partenerUserName = AppSharedPreferences.getPartenerName();
    return Container(
      color: AppColors.backGroundColor,
      child: Column(
        children: [
          //? app bar
          PreferredSize(
            preferredSize: Size.fromHeight(60.sp),
            child: BlocBuilder<ViewCubit, ViewState>(
              builder: (context, state) {
                return CustomAppBar(
                  text: partenerUserName,
                  onBack: () {
                    context
                        .read<ViewCubit>()
                        .changeViewPage(ViewPageChange.showMessage);
                  },
                );
                //?
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 25.sp,
                horizontal: PaddingApp.paddingSpaceBetween1.sp,
              ),
              //! messages

              child: BlocBuilder<GetAllDialogMessageCubit,
                  GetAllMessageDialogState>(
                builder: (context, state) {
                  if (state.status == StatusCubit.loading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state.status == StatusCubit.done) {
                    return RefreshIndicator(
                      child: ListMessageWidget(
                        messageList: state.listMessage,
                      ),
                      onRefresh: () => context
                          .read<GetAllDialogMessageCubit>()
                          .getAllMessage(),
                    );
                  }
                  return const SizedBox();
                },
              ),
              //!
            ),
          ),
          Row(
            children: [
              //! fliled for send message
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.sp,
                    vertical: 10.sp,
                  ),
                  child: const SendMessageFiledWidget(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
