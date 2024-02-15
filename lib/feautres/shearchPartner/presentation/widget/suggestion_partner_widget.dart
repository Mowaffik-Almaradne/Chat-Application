import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';
import 'package:flutter_test_chat1/core/enum/status_enum.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_image_widget.dart';
import 'package:flutter_test_chat1/core/widget/another/not_found_image_widget.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/bloc/image_bloc/cubit/image_cubit.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/bloc/image_bloc/cubit/image_state.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/logic/function/function_signup.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/data/model/res/partner_response_model.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/presentation/logic/varibale_logic.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/presentation/widget/custom_button_widget.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/presentation/widget/info_partner_widget.dart';

class SuggestionPartnerWidget extends StatelessWidget {
  const SuggestionPartnerWidget({super.key, required this.partnerInfo});
  final List<PartnerInfo> partnerInfo;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          width: 400.w,
          height: 220.h,
          child: Card(
            color: AppColors.textColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
              child: Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                        right: 12.r,
                        bottom: 18.r,
                      ),
                      //! image partener
                      child: BlocBuilder<ImageCubit, ImageState>(
                        builder: (context, state) {
                          if (state.status == StatusCubit.done) {
                            return CustomImageWidget(
                              image: '$partdeleteImage${state.image}',
                              visible:
                                  LogicSearchPartener.imagePartener.isNotEmpty,
                            );
                          }
                          return const NotFoundImageWidget();
                        },
                      )),
                  //! information  partner
                  Expanded(
                    child: InfoPartnerWidget(
                      partnerInfo: partnerInfo,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        //! buuton for message
        const CustomButtonPartnerWidget(),
      ],
    );
  }
}
