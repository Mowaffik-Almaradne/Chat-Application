import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_family_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_size_helper.dart';
import 'package:flutter_test_chat1/core/shared/bloc/viewbloc/cubit/view_cubit.dart';
import 'package:flutter_test_chat1/core/enum/view_page_enum.dart';
import 'package:flutter_test_chat1/core/shared/sharedPrefrances/shared_pref.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_image_widget.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_text_widget.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/res/response_get_all_message.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/widget/date_message_formatter_widget.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/logic/function/function_signup.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/presentation/logic/varibale_logic.dart';

class MessageinfoWidget extends StatelessWidget {
  const MessageinfoWidget({super.key, required this.messageInfo});
  final List<DialogMessageInfo> messageInfo;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 25.sp, vertical: 30.sp),
      separatorBuilder: (context, index) => SizedBox(height: 20.sp),
      itemCount: messageInfo.length,
      itemBuilder: (context, index) {
        //! cash Account id
        AppSharedPreferences.cachePartenerAccountId(
          partenerAccountId: messageInfo[index].accountId,
        );

        AppSharedPreferences.cachMessageList(
          cachMessageList: messageInfo[index].id,
        );

        return InkWell(
          onTap: () {
            context
                .read<ViewCubit>()
                .changeViewPage(ViewPageChange.sendMessage);
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: 80.w,
                height: 100.h,
                child: CustomImageWidget(
                  image: '$partdeleteImage${LogicSearchPartener.imagePartener}',
                  visible: LogicSearchPartener.imagePartener.isNotEmpty,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.sp, bottom: 2.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        TextWidget(
                          text: messageInfo[index].fullName,
                          fontFamily: FontFamily.fontPoppinsBold,
                          fontSize: 16.sp,
                          color: AppColors.subColor,
                        ),
                        SizedBox(width: 10.w),
                        DateMessageFormatterWidget(
                          day: messageInfo[index]
                              .lastMessageTime!
                              .day
                              .toString(),
                          month: messageInfo[index]
                              .lastMessageTime!
                              .month
                              .toString(),
                          year: messageInfo[index]
                              .lastMessageTime!
                              .year
                              .toString(),
                        ),
                      ],
                    ),
                    TextWidget(
                      text: messageInfo[index].lastMessage,
                      fontFamily: FontFamily.fontPoppinsRegular,
                      fontSize: FontSize.fontSmall1,
                      color: AppColors.subColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
