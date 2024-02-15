//! create objecct for pass signup
import 'package:flutter/material.dart';
import 'package:flutter_test_chat1/core/widget/fildes/custom_drop_down_form_filed_widget.dart';
import 'package:flutter_test_chat1/feautres/auth/data/model/req/register_request_model.dart';

class VarableRigister {
  //! icon
  static Color? colorIcon;
  static int? valuegender;
  static int? valueCountry;
  static int? valueCity;
  static String valueAge = '';
  static RegisterRequest registerModel = RegisterRequest(
    age: 0,
    name: '',
    gender: Gender.male.index,
    cityId: 0,
    countryId: 0,
    phoneNumber: '',
    emailAddress: '',
    password: '',
    avatar: '',
  );
//!
//! create var for check box
  static bool valueCheck = false;
//! list gender
 static final List<CustomDropdownItem> genderItems = [
    CustomDropdownItem(value: Gender.male.index, item: Gender.male.name),
    CustomDropdownItem(value: Gender.female.index, item: Gender.female.name),
  ];

//! form key rigester
  static final GlobalKey<FormState> formKeyRegister = GlobalKey<FormState>();

//! reenter password
  static String reentrPassword = '';
}
