import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_family_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_size_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/function/function_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/function/validation_function_helper.dart';
import 'package:flutter_test_chat1/core/Utils/snackbar/snack_bar.dart';
import 'package:flutter_test_chat1/core/enum/status_enum.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_elevated_button_widget.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_filed_show_icon_widget.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_image_widget.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_text_widget.dart';
import 'package:flutter_test_chat1/core/widget/fildes/custom_drop_down_form_filed_widget.dart';
import 'package:flutter_test_chat1/core/widget/fildes/custom_text_form_filed_widget.dart';
import 'package:flutter_test_chat1/core/strings/image.dart';
import 'package:flutter_test_chat1/core/strings/text_words.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/bloc/register_bloc/cubit/register_cubit.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/logic/function/function_signup.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/logic/varibles/varable_signup.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/widget/bottom_navigation_widget.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/widget/custom_check_box_widget.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/widget/custom_show_dialog.dart';
import 'package:flutter_test_chat1/feautres/ragion/Cities/presentation/bloc/cubit/cities_cubit.dart';
import 'package:flutter_test_chat1/feautres/ragion/Cities/presentation/bloc/cubit/cities_state.dart';
import 'package:flutter_test_chat1/feautres/ragion/Country/presentation/bloc/cubit/countries_cubit.dart';
import 'package:flutter_test_chat1/feautres/ragion/Country/presentation/bloc/cubit/countries_state.dart';
import 'package:flutter_test_chat1/router/app_router.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //! navigation bar btton
      bottomNavigationBar: const CustomBottomNavigationButton(
        routeName: RouteNamedScreens.loginScreenNameRoute,
        subText: TextWord.navigationButtonSignup,
        textLoginOrSignUp: TextWord.login,
      ),
      //!
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 31.r,
          ),
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    PathImageApp.backgroundImageAll,
                  ),
                ),
              ),
              child: Form(
                key: VarableRigister.formKeyRegister,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 19.r,
                      ),
                      child: TextWidget(
                        text: TextWord.signUp,
                        fontSize: FontSize.fontMeduimeSubText,
                        fontFamily: FontFamily.fontPoppinsBold,
                        color: AppColors.subColor,
                      ),
                    ),
                    //! Image selected frmo gallar
                    BlocBuilder<RegisterCubit, RegisterState>(
                      builder: (context, state) {
                        substringImage64Methode(state);
                        return Padding(
                          padding: EdgeInsetsDirectional.only(
                            bottom: 13.r,
                            start: 60.r,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomImageWidget(
                                image: state.imag64,
                                visible: state.imag64.isNotEmpty,
                              ),
                              //! button to chooes image from gallery
                              IconButton(
                                onPressed: () {
                                  context.read<RegisterCubit>().getImage();
                                },
                                icon: Image(
                                  color: AppColors.subColor,
                                  image: const AssetImage(
                                    PathImageApp.pencilIcon,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    //! Text Filed User Name
                    CustomShowIconFiled(
                      coustomTextFiledWidget: CoustomTextFiledWidget(
                        hintText: TextWord.name,
                        textInputType: TextInputType.name,
                        onChange: (value) {
                          VarableRigister.registerModel.name = value;
                        },
                        validator: (value) => validator(value!),
                      ),
                      visible: false,
                    ),
                    //! Text Filed User Age
                    CustomShowIconFiled(
                      coustomTextFiledWidget: CoustomTextFiledWidget(
                        hintText: TextWord.age,
                        textInputType: TextInputType.number,
                        inputFormatter: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChange: (value) {
                          if (value.isNotEmpty && value.contains(ageRegex)) {
                            VarableRigister.registerModel.gender =
                                int.parse(value);
                          }
                        },
                        validator: (value) => validator(value!),
                      ),
                      visible: false,
                    ),
                    //! Drop Dowan form filed  gender
                    CustomShowIconFiled(
                      coustomTextFiledWidget: DropDownFormFiledWidget(
                        hintText: TextWord.gender,
                        items: VarableRigister.genderItems,
                        onChanged: (value) {
                          VarableRigister.valuegender = value;
                          VarableRigister.registerModel.gender = value ?? 0;
                        },
                        validator: (value) => validateDropdownFormField(value),
                      ),
                      visible: false,
                    ),
                    //! Drop Dowan form filed  Countries
                    BlocBuilder<CountriesCubit, CountriesState>(
                      builder: (context, state) {
                        return CustomShowIconFiled(
                          coustomTextFiledWidget: DropDownFormFiledWidget(
                            hintText:
                                hintText(state.countries, TextWord.country),
                            items: showCountries(state),
                            onChanged: (value) {
                              VarableRigister.registerModel.countryId =
                                  value ?? 0;
                              VarableRigister.valueCountry =
                                  VarableRigister.registerModel.countryId;
                              context.read<CitiesCubit>().getAllCities();
                            },
                            validator: (value) =>
                                validateDropdownFormField(value),
                          ),
                          visible: false,
                        );
                      },
                    ),
                    //!Drop Dowan form filed  Cities
                    BlocBuilder<CitiesCubit, CitiesState>(
                      builder: (context, state) {
                        return CustomShowIconFiled(
                          coustomTextFiledWidget: DropDownFormFiledWidget(
                            hintText: hintText(state.cities, TextWord.city),
                            items: showCities(
                                state, VarableRigister.valueCountry ?? 0),
                            onChanged: (value) {
                              VarableRigister.valueCity = value;
                              VarableRigister.registerModel.cityId = value ?? 0;
                            },
                            validator: (value) =>
                                validateDropdownFormField(value),
                          ),
                          visible: false,
                        );
                      },
                    ),
                    //! Text Filed User Phone number
                    CustomShowIconFiled(
                      coustomTextFiledWidget: CoustomTextFiledWidget(
                        hintText: TextWord.phoneNumber,
                        textInputType: TextInputType.phone,
                        onChange: (value) {
                          VarableRigister.registerModel.phoneNumber = value;
                        },
                        // suffixIcon: ,
                        validator: (value) => validatorPhone(value!),
                      ),
                      visible: false,
                    ),
                    //! Text Filed User Email
                    CustomShowIconFiled(
                      coustomTextFiledWidget: CoustomTextFiledWidget(
                        hintText: TextWord.email,
                        textInputType: TextInputType.emailAddress,
                        suffixIcon: PathImageApp.emailIcon,
                        colorsuffixIcon: colorSuffixIcon(
                            VarableRigister.registerModel.emailAddress),
                        onChange: (value) {
                          VarableRigister.registerModel.emailAddress = value;
                        },
                        validator: (value) => validatorEmail(value!),
                      ),
                      visible: false,
                    ),
                    //! Text Filed User Password
                    CustomShowIconFiled(
                        coustomTextFiledWidget: CoustomTextFiledWidget(
                          hintText: TextWord.password,
                          obscureText: true,
                          textInputType: TextInputType.visiblePassword,
                          suffixIcon: PathImageApp.passwordOrReenterIcon,
                          onChange: (value) {
                            VarableRigister.registerModel.password = value;
                          },
                          validator: (value) =>
                              validatorPassword(value!, context),
                        ),
                        visible: false),
                    //!Text Filed User Reenter Password
                    CustomShowIconFiled(
                      coustomTextFiledWidget: CoustomTextFiledWidget(
                        obscureText: true,
                        hintText: TextWord.reenterPassword,
                        textInputType: TextInputType.visiblePassword,
                        suffixIcon: PathImageApp.passwordOrReenterIcon,
                        onChange: (value) {
                          VarableRigister.reentrPassword = value;
                        },
                        validator: (value) => validatorRenterPassword(value!),
                      ),
                      visible: VarableRigister.reentrPassword.isNotEmpty,
                    ),

                    //! accept all terms check box
                    StatefulBuilder(
                      builder: (BuildContext context, setState) {
                        return CustomCheckBoxWidget(
                          textColor: colorCheckBoxMethodeRegister(),
                          subTextOne: TextWord.accept,
                          subTextTwo: TextWord.termsServices,
                          value: VarableRigister.valueCheck,
                          onChanged: (value) {
                            setState(
                              () {
                                VarableRigister.valueCheck = value ?? false;
                              },
                            );
                          },
                        );
                      },
                    ),
                    //! button sign up
                    BlocConsumer<RegisterCubit, RegisterState>(
                      listener: (context, state) {
                        if (state.status == StatusCubit.failed) {
                          SnackBarUtil.showSnackBar(
                            message: state.error,
                            context: context,
                          );
                        } else if (state.status == StatusCubit.done) {
                          CustomShowDialog.customShowDialog(context);
                        }
                      },
                      builder: (context, state) {
                        if (state.status == StatusCubit.loading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return Padding(
                          padding: EdgeInsets.only(bottom: 20.r),
                          child: CustomElevatedButton(
                            onPreesed: () {
                              if (VarableRigister.formKeyRegister.currentState!
                                  .validate()) {
                                context.read<RegisterCubit>().register(
                                    registerModel:
                                        VarableRigister.registerModel);
                              }
                            },
                            //! style:
                            text: TextWord.signUp,
                            backgroundColor: AppColors.primaryColor,
                            textColor: AppColors.textColor,
                            sideColor: AppColors.primaryColor,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
