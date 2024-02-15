import 'dart:ui';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';
import 'package:flutter_test_chat1/core/Utils/helper/function/function_helper.dart';
import 'package:flutter_test_chat1/core/widget/fildes/custom_drop_down_form_filed_widget.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/bloc/register_bloc/cubit/register_cubit.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/logic/varibles/varable_signup.dart';
import 'package:flutter_test_chat1/feautres/ragion/Cities/data/model/res/response_cities_model.dart';
import 'package:flutter_test_chat1/feautres/ragion/Cities/presentation/bloc/cubit/cities_state.dart';
import 'package:flutter_test_chat1/feautres/ragion/Country/presentation/bloc/cubit/countries_state.dart';

//! color suffix icon
Color colorSuffixIcon(String filedValue) {
  if (filedValue.isNotEmpty) {
    return AppColors.primaryColor;
  } else {
    return AppColors.subColor;
  }
}

//!

//! for check box color
Color colorCheckBoxMethodeRegister() {
  return VarableRigister.valueCheck
      ? AppColors.primaryColor
      : AppColors.subColor;
}

String partdeleteImage = '/9j/';
//! cut path for image
void substringImage64Methode(RegisterState state) {
  if (state.imag64.length >= 4) {
    VarableRigister.registerModel.avatar =
        state.imag64.substring(4, state.imag64.length);
  } else {
    VarableRigister.registerModel.avatar = '';
  }
}

//! function for List countris
List<CustomDropdownItem> showCountries(CountriesState state) {
  List<CustomDropdownItem> dropdownItems = state.countries
      .where((countryName) => countryName.id <= 32)
      .map((element) {
    return CustomDropdownItem(
      item: element.name.split('-')[0].trim(),
      value: element.id,
    );
  }).toList();
  return dropdownItems;
}

//!  function for List citiess
List<CustomDropdownItem> showCities(CitiesState state, int valueCountry) {
  List<CustomDropdownItem> cityItems = [];
  List<Cities> fillterCity = state.cities
      .where(
        (element) => valueCountry == element.countryId,
      )
      .toList();
  cityItems = fillterCity.map((e) {
    return CustomDropdownItem(
      item: extractCityName(e.name),
      value: e.id,
    );
  }).toList();

  return cityItems;
}
