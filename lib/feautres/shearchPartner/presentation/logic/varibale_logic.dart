import 'package:flutter/material.dart';
import 'package:flutter_test_chat1/core/shared/sharedPrefrances/shared_pref.dart';
import 'package:flutter_test_chat1/core/widget/fildes/custom_drop_down_form_filed_widget.dart';
import 'package:flutter_test_chat1/core/strings/text_words.dart';
import 'package:flutter_test_chat1/feautres/auth/data/model/req/register_request_model.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/data/model/req/partner_request_model.dart';

class LogicSearchPartener {
  //? varable and object :
  static int? valueCountryPartner;
  static int? valueCityPartner;
  static int? valueGenderPartner;
  static int? minAge;
  static int? maxAge;
  static List<CustomDropdownItem> cityItems = [];
  static int userId = AppSharedPreferences.getUserId();
  static String imagePartener = AppSharedPreferences.getPartenerImage();
  static TextEditingController controllerDate = TextEditingController();

  static PartnerRequest partnerModel = PartnerRequest(
    cityId: 0,
    countryId: 0,
    gender: 0,
    minAge: 0,
    maxAge: 0,
    skipCount: 0,
    maxResultCount: 10,
    date: '',
  );

  static final GlobalKey<FormState> formKeyPartner = GlobalKey<FormState>();
  static final List<CustomDropdownItem> genderItemsSearchPartner = [
    CustomDropdownItem(value: Gender.male.index, item: TextWord.male),
    CustomDropdownItem(value: Gender.female.index, item: TextWord.female),
  ];
}
