

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_family_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_size_helper.dart';
import 'package:flutter_test_chat1/core/shared/bloc/navigationbuttoncubit/navigation_button_cubit.dart';
import 'package:flutter_test_chat1/core/shared/bloc/viewbloc/cubit/view_cubit.dart';
import 'package:flutter_test_chat1/core/enum/view_page_enum.dart';
import 'package:flutter_test_chat1/core/strings/image.dart';
import 'package:flutter_test_chat1/core/strings/text_words.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/page/message_page.dart';
import 'package:flutter_test_chat1/feautres/home/presentation/page/home_page.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/presentation/page/partner_page.dart';

List<Widget> screens = [
  const HomePage(),
  const SearchPartnerPage(),
  const MessagePage(),
];

class PrimaryPage extends StatelessWidget {
  const PrimaryPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllPagesCubit, AllPagesState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.backGroundColor,
          body: screens[state.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              context.read<AllPagesCubit>().changeButton(value);
              if (value == 2) {
                context
                    .read<ViewCubit>()
                    .changeViewPage(ViewPageChange.showMessage);
              } else if (value == 1) {
                context
                    .read<ViewCubit>()
                    .changeViewPage(ViewPageChange.searchPartner);
              }
            },
            backgroundColor: AppColors.backGroundColor,
            unselectedLabelStyle: TextStyle(
              fontSize: FontSize.fontSmall1,
              fontFamily: FontFamily.fontPoppinsMedium,
            ),
            selectedLabelStyle: TextStyle(
              fontSize: FontSize.fontSmall1,
              fontFamily: FontFamily.fontPoppinsBold,
            ),
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.subColor,
            elevation: 100,
            currentIndex: state.currentIndex,
            items: [
              //! home Tap
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  PathImageApp.iconeHome,
                  color: colorTapMethode(state, 0),
                ),
                label: TextWord.home,
              ),
              //! Search Tap
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  PathImageApp.iconSearch,
                  color: colorTapMethode(state, 1),
                ),
                label: TextWord.search,
              ),

              //! message Tap
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  PathImageApp.iconeMessages,
                  color: colorTapMethode(state, 2),
                ),
                label: TextWord.messages,
              ),
            ],
          ),
        );
      },
    );
  }

//! function color navigation
  Color colorTapMethode(AllPagesState state, int currentIndex) {
    if (state.currentIndex == currentIndex) {
      return AppColors.primaryColor;
    } else {
      return AppColors.subColor;
    }
  }
}
