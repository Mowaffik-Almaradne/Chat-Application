import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_family_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/fonts/fonts_size_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/function/function_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/function/validation_function_helper.dart';
import 'package:flutter_test_chat1/core/shared/bloc/viewbloc/cubit/view_cubit.dart';
import 'package:flutter_test_chat1/core/shared/bloc/viewbloc/cubit/view_state.dart';
import 'package:flutter_test_chat1/core/enum/view_page_enum.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_app_bar_widget.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_elevated_button_widget.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_filed_show_icon_widget.dart';
import 'package:flutter_test_chat1/core/widget/another/custom_text_widget.dart';
import 'package:flutter_test_chat1/core/widget/fildes/custom_drop_down_form_filed_widget.dart';
import 'package:flutter_test_chat1/core/widget/fildes/custom_text_form_filed_widget.dart';
import 'package:flutter_test_chat1/core/strings/image.dart';
import 'package:flutter_test_chat1/core/strings/text_words.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/bloc/image_bloc/cubit/image_cubit.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/logic/function/function_signup.dart';
import 'package:flutter_test_chat1/feautres/ragion/Cities/presentation/bloc/cubit/cities_cubit.dart';
import 'package:flutter_test_chat1/feautres/ragion/Cities/presentation/bloc/cubit/cities_state.dart';
import 'package:flutter_test_chat1/feautres/ragion/Country/presentation/bloc/cubit/countries_cubit.dart';
import 'package:flutter_test_chat1/feautres/ragion/Country/presentation/bloc/cubit/countries_state.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/presentation/bloc/partnerbloc/cubit/partner_cubit.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/presentation/bloc/partnerbloc/cubit/partner_state.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/presentation/logic/varibale_logic.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/presentation/widget/custom_age_widget.dart';

class ShearchPartnerView extends StatelessWidget {
  const ShearchPartnerView({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: LogicSearchPartener.formKeyPartner,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 60.h),
              child: CustomAppBar(text: TextWord.findPartner),
            ),
            //! select country
            BlocBuilder<CountriesCubit, CountriesState>(
              builder: (context, state) {
                List<CustomDropdownItem> dropdownItems = showCountries(state);
                return CustomShowIconFiled(
                  coustomTextFiledWidget: DropDownFormFiledWidget(
                    hintText: hintText(state.countries, TextWord.country),
                    items: dropdownItems,
                    onChanged: (value) {
                      LogicSearchPartener.valueCountryPartner = value ?? 0;
                      LogicSearchPartener.partnerModel.countryId = value ?? 0;
                      context.read<CitiesCubit>().getAllCities();
                    },
                    validator: (value) => validateDropdownFormField(value),
                  ),
                  visible: false,
                );
              },
            ),
            //! select city
            BlocBuilder<CitiesCubit, CitiesState>(
              builder: (context, state) {
                LogicSearchPartener.cityItems = showCities(
                    state, LogicSearchPartener.valueCountryPartner ?? 0);
                return CustomShowIconFiled(
                  coustomTextFiledWidget: DropDownFormFiledWidget(
                    hintText: hintText(state.cities, TextWord.city),
                    items: LogicSearchPartener.cityItems,
                    onChanged: (value) {
                      LogicSearchPartener.valueCityPartner = value ?? 0;
                      LogicSearchPartener.partnerModel.cityId = value ?? 0;
                    },
                    validator: (value) => validateDropdownFormField(value),
                  ),
                  visible: false,
                );
              },
            ),
            //! select gender
            CustomShowIconFiled(
              coustomTextFiledWidget: DropDownFormFiledWidget(
                hintText: TextWord.gender,
                items: LogicSearchPartener.genderItemsSearchPartner,
                onChanged: (value) {
                  LogicSearchPartener.valueGenderPartner = value ?? 0;
                  LogicSearchPartener.partnerModel.gender = value ?? 0;
                },
                validator: (value) => validateDropdownFormField(value),
              ),
              visible: false,
            ),

            Padding(
              padding: EdgeInsets.only(
                left: 21.r,
                bottom: 25.r,
              ),
              child: Row(
                children: [
                  TextWidget(
                    text: TextWord.partnerAge,
                    fontFamily: FontFamily.fontPoppinsBold,
                    fontSize: FontSize.fontMeduime,
                    color: AppColors.subColor,
                  ),
                ],
              ),
            ),
            //! Text form between Age
            CustomAgeWidget(
              text: TextWord.between,
              textFormWidget: Padding(
                padding: EdgeInsets.only(left: 25.w, right: 28.w),
                child: CoustomTextFiledWidget(
                  hintText: TextWord.age,
                  inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                  onChange: (value) {
                    if (value.isNotEmpty && value.contains(ageRegex)) {
                      LogicSearchPartener.partnerModel.maxAge =
                          int.parse(value);
                    }
                  },
                  textInputType: TextInputType.number,
                  validator: (value) =>
                      validatorAndAge(LogicSearchPartener.partnerModel.maxAge),
                ),
              ),
            ),
            //! Text form and Age
            CustomAgeWidget(
              text: TextWord.and,
              textFormWidget: Padding(
                padding: EdgeInsets.only(left: 75.w, right: 26.w),
                child: CoustomTextFiledWidget(
                  hintText: TextWord.age,
                  inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                  onChange: (value) {
                    if (value.isNotEmpty && value.contains(ageRegex)) {
                      LogicSearchPartener.partnerModel.minAge =
                          int.parse(value);
                    }
                  },
                  textInputType: TextInputType.number,
                  validator: (value) => validatorBetweenAge(
                      LogicSearchPartener.partnerModel.minAge),
                ),
              ),
            ),

            //! Text form  Date
            Padding(
              padding: EdgeInsets.only(
                top: 12.sp,
                bottom: 30.sp,
              ),
              child: CustomShowIconFiled(
                coustomTextFiledWidget: CoustomTextFiledWidget(
                  controller: LogicSearchPartener.controllerDate,
                  hintText: TextWord.date,
                  suffixIcon: PathImageApp.calendar,
                  onChange: (value) {
                    LogicSearchPartener.partnerModel.date = value;
                  },
                  validator: (value) => validator(value!),
                  onPressed: () async {
                    DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );

                    if (selectedDate != null) {
                      LogicSearchPartener.partnerModel.date =
                          selectedDate.toString().substring(0, 10);
                      ;
                      LogicSearchPartener.controllerDate.text =
                          LogicSearchPartener.partnerModel.date;
                    }
                  },
                  textInputType: TextInputType.datetime,
                ),
                visible: false,
              ),
            ),
            //! search button
            Padding(
              padding: EdgeInsets.only(bottom: 40.r),
              child: BlocBuilder<ViewCubit, ViewState>(
                builder: (context, state) {
                  return BlocBuilder<PartnerCubit, PartnerState>(
                    builder: (context, state) {
                      return CustomElevatedButton(
                        text: TextWord.search,
                        backgroundColor: AppColors.primaryColor,
                        textColor: AppColors.textColor,
                        sideColor: AppColors.primaryColor,
                        width: 2,
                        onPreesed: () {
                          if (LogicSearchPartener.formKeyPartner.currentState!
                              .validate()) {
                            context.read<ViewCubit>().changeViewPage(
                                ViewPageChange.suggestionsPartners);
                            context.read<PartnerCubit>().getAllPartner(
                                partnerModel: LogicSearchPartener.partnerModel);
                            context
                                .read<ImageCubit>()
                                .getImage(id: LogicSearchPartener.userId);
                          }
                        },
                        icon: PathImageApp.iconSearch,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
