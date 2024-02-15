import 'package:flutter/material.dart';
import 'package:flutter_test_chat1/core/strings/validation_words.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/logic/varibles/varable_signup.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/presentation/logic/varibale_logic.dart';

//!  this is varable  RegExp for password
final passwordPattern = RegExp(
  r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d!@#$%^&*()_+]{8,}$',
);
//!  this is varable  RegExp for email
final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

//!  this is varable  RegExp for age
final ageRegex = RegExp(r'^[0-9]*$');
//!  this is varable  RegExp for phone
RegExp phoneRegex = RegExp(r'^\+?[0-9]{10,}$');

//! validatio any text form filed
String? validator(String value) {
  if (value.isEmpty) {
    return ValidationWords.requiredField;
  } else {
    return null;
  }
}

//! validation any drop dowan form filed
String? validateDropdownFormField(dynamic value) {
  if (value == null) {
    return ValidationWords.requiredField;
  }
  return null;
}

//! validatio to email
String? validatorEmail(String value) {
  if (value.isEmpty) {
    return ValidationWords.requiredField;
  } else if (!emailRegex.hasMatch(value)) {
    return ValidationWords.emailPattren;
  }
  return null;
}

//! validation to password
String? validatorPassword(String value, BuildContext context) {
  if (value.isEmpty) {
    return ValidationWords.requiredField;
  } else if (value.length < 6) {
    return ValidationWords.passwordLength;
  } else if (!passwordPattern.hasMatch(value)) {
    return ValidationWords.ensurePasssword;
  }
  return null;
}

//! vilidation to RenterPassword
String? validatorRenterPassword(String value) {
  if (value.isEmpty) {
    return ValidationWords.requiredField;
  } else if (VarableRigister.registerModel.password !=
      VarableRigister.reentrPassword) {
    return ValidationWords.reenterPasswoprd;
  }
  return null;
}

//! vilidation to between Age filed
String? validatorBetweenAge(int value) {
  if (value == 0) {
    return ValidationWords.requiredField;
  } else if (value < LogicSearchPartener.partnerModel.maxAge) {
    return ValidationWords.andAge;
  }
  return null;
}

//! vilidation to and Age filed
String? validatorAndAge(int value) {
  if (value == 0) {
    return ValidationWords.requiredField;
  } else if (value > LogicSearchPartener.partnerModel.minAge) {
    return ValidationWords.betweenAge;
  }
  return null;
}
//? vilidation for phone number 
String? validatorPhone(String value) {
  if (value.isEmpty) {
    return ValidationWords.requiredField;
  } else if (!phoneRegex.hasMatch(value)) {
    return ValidationWords.phoneNumber;
  }
  return null;
}
