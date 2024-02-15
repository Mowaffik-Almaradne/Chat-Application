import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_family_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_size_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/function/function_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/function/validation_function_helper.dart';
import 'package:flutter_test_chat1/core/Utils/snackbar/snack_bar.dart';
import 'package:flutter_test_chat1/core/enum/status_enum.dart';
import 'package:flutter_test_chat1/core/shared/sharedPrefrances/shared_pref.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_elevated_button_widget.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_filed_show_icon_widget.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_text_widget.dart';
import 'package:flutter_test_chat1/core/widget/fildes/custom_text_form_filed_widget.dart';
import 'package:flutter_test_chat1/core/strings/image.dart';
import 'package:flutter_test_chat1/core/strings/text_words.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/req/request_fire_base_model.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/cubit/sendfirebasetoken/cubit/firebasetoken_cubit.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/bloc/login_bloc/cubit/login_cubit.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/bloc/login_bloc/cubit/login_state.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/logic/function/function_signup.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/logic/varibles/varable_login.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/widget/bottom_navigation_widget.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/widget/custom_check_box_widget.dart';
import 'package:flutter_test_chat1/router/app_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationButton(
        routeName: RouteNamedScreens.signUpScreenNameRoute,
        subText: TextWord.dontHaveAnyAccount,
        textLoginOrSignUp: TextWord.signUp,
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                PathImageApp.backgroundImageAll,
              ),
            ),
          ),
          child: Form(
            key: VarableLogin.formKeyLogin,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  50.0.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.only(bottom: 206).r,
                    child: TextWidget(
                      text: TextWord.login,
                      fontFamily: FontFamily.fontPoppinsBold,
                      fontSize: FontSize.fontMeduimeSubText,
                      color: AppColors.subColor,
                    ),
                  ),
                  //! Email filed for user

                  CustomShowIconFiled(
                    coustomTextFiledWidget: CoustomTextFiledWidget(
                      hintText: TextWord.email,
                      textInputType: TextInputType.emailAddress,
                      suffixIcon: PathImageApp.emailIcon,
                      colorsuffixIcon: colorSuffixIcon(
                          VarableLogin.loginModel.userNameOrEmailAddress),
                      onChange: (value) {
                        VarableLogin.loginModel.userNameOrEmailAddress = value;
                      },
                      validator: (value) => validator(value!),
                    ),
                    visible: false,
                  ),
                  //! password filed for user
                  CustomShowIconFiled(
                    coustomTextFiledWidget: CoustomTextFiledWidget(
                      obscureText: true,
                      hintText: TextWord.password,
                      textInputType: TextInputType.visiblePassword,
                      suffixIcon: PathImageApp.passwordOrReenterIcon,
                      onChange: (value) =>
                          VarableLogin.loginModel.password = value,
                      validator: (value) => validatorPassword(value!, context),
                    ),
                    visible: false,
                  ),
                  // !remmber me

                  StatefulBuilder(
                    builder: (BuildContext context, setState) {
                      return CustomCheckBoxWidget(
                        textColor: colorCheckBoxMethodeLogin(),
                        subTextOne: TextWord.remmberMe,
                        value: VarableLogin.remmberMe,
                        onChanged: (value) {
                          setState(
                            () {
                              if (VarableLogin.loginModel.userNameOrEmailAddress
                                      .isNotEmpty &&
                                  VarableLogin.loginModel.password.isNotEmpty) {
                                VarableLogin.remmberMe = value ?? false;
                                VarableLogin.loginModel.rememberClient =
                                    VarableLogin.remmberMe;
                                AppSharedPreferences.cacheRememberMeValue(
                                  VarableLogin.loginModel.rememberClient,
                                );
                              } else {
                                VarableLogin.remmberMe = false;
                                SnackBarUtil.showSnackBar(
                                  message: TextWord.messageForRemmberMe,
                                  context: context,
                                );
                              }
                            },
                          );
                        },
                      );
                    },
                  ),
                  //! button login
                  BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state.status == StatusCubit.failed) {
                        SnackBarUtil.showSnackBar(
                          message: state.error,
                          context: context,
                        );
                      } else if (state.status == StatusCubit.done) {
                        navigationPage(
                          context,
                          page: RouteNamedScreens.primaryScreenNameRoute,
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state.status == StatusCubit.loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return CustomElevatedButton(
                        onPreesed: () async {
                          if (VarableLogin.formKeyLogin.currentState!
                              .validate()) {
                            context
                                .read<LoginCubit>()
                                .login(loginModel: VarableLogin.loginModel);

                            //! create obj for token fire base :
                            FireBaseTokenRequest tokenModel =
                                await VarableLogin.insertFireBaseToken();
                            context
                                .read<FireBaseTokenCubit>()
                                .sendToken(tokenModel: tokenModel);
                          }
                        },
                        text: TextWord.login,
                        backgroundColor: AppColors.primaryColor,
                        textColor: AppColors.textColor,
                        sideColor: AppColors.primaryColor,
                        width: 2,
                      );
                    },
                  ),
                  //!
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//? //? for check box color
Color colorCheckBoxMethodeLogin() {
  return VarableLogin.remmberMe ? AppColors.primaryColor : AppColors.subColor;
}
