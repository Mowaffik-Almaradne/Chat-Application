// Function

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_chat1/core/strings/text_words.dart';


//!  Function to print all response
void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) {
    if (kDebugMode) {
      print(match.group(0));
    }
  });
}

//! extract city of () nad -
String extractCityName(String input) {
  // Split the string based on opening and closing parentheses
  List<String> parts = input.split('(');

  // Extract the second part and remove leading/trailing spaces
  String cityName = parts.length > 1
      ? parts[1].split(')')[0].trim()
      : input.split('-')[0].trim();

  return cityName;
}

//! function navigation to any page
void navigationPage(BuildContext context, {required String page}) {
  Navigator.pushNamedAndRemoveUntil(
    context,
    page,
    (route) => false,
  );
}

//! thisi function for hint text
String hintText(List<dynamic> data, String hintText) {
  if (data.isEmpty) {
    return TextWord.pleeseWaite;
  } else {
    return hintText;
  }
}

