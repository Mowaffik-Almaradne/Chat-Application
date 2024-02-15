import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_chat1/core/shared/bloc/viewbloc/cubit/view_cubit.dart';
import 'package:flutter_test_chat1/core/shared/bloc/viewbloc/cubit/view_state.dart';
import 'package:flutter_test_chat1/core/enum/status_enum.dart';
import 'package:flutter_test_chat1/core/enum/view_page_enum.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_app_bar_widget.dart';
import 'package:flutter_test_chat1/core/strings/text_words.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/presentation/bloc/partnerbloc/cubit/partner_cubit.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/presentation/bloc/partnerbloc/cubit/partner_state.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/presentation/widget/not_found_partner_widget.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/presentation/widget/suggestion_partner_widget.dart';

class SuggestionsPartnerView extends StatelessWidget {
  const SuggestionsPartnerView({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PreferredSize(
          preferredSize: Size.fromHeight(75.h),
          child: BlocBuilder<ViewCubit, ViewState>(
            builder: (context, state) {
              return CustomAppBar(
                text: TextWord.suggestionspartners,
                onBack: () {
                  context
                      .read<ViewCubit>()
                      .changeViewPage(ViewPageChange.searchPartner);
                },
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 17.w,
            vertical: 25.h,
          ),
          child: BlocBuilder<PartnerCubit, PartnerState>(
            builder: (context, state) {
              if (state.status == StatusCubit.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.status == StatusCubit.done) {
                return Visibility(
                  visible: state.partner.isNotEmpty,
                  replacement: const NotFoundPartenerWidget(),
                  child: SuggestionPartnerWidget(
                    partnerInfo: state.partner,
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}
