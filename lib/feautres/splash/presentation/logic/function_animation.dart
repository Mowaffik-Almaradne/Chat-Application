import 'package:flutter/material.dart';
import 'package:flutter_test_chat1/core/Utils/helper/function/function_helper.dart';
import 'package:flutter_test_chat1/core/shared/sharedPrefrances/shared_pref.dart';
import 'package:flutter_test_chat1/router/app_router.dart';

//! this is functio navigate to page with animation
void navigationToPage(BuildContext context) {
  Future.delayed(
    const Duration(seconds: 3),
    () {
      if (AppSharedPreferences.getRememberMeValue()) {
        navigationPage(context, page: RouteNamedScreens.primaryScreenNameRoute);
      } else {
        navigationPage(context,
            page: RouteNamedScreens.loginOrRigesterScreenNameRoute);
      }
    },
  );
}
