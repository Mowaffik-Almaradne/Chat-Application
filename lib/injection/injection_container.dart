import 'package:flutter/material.dart';
import 'package:flutter_test_chat1/core/network/network_info.dart';
import 'package:flutter_test_chat1/injection/auth/auth_injection.dart';
import 'package:flutter_test_chat1/injection/message/message_injection.dart';
import 'package:flutter_test_chat1/injection/partner/partner_injection.dart';
import 'package:flutter_test_chat1/injection/visit/cities/cities_injection.dart';
import 'package:flutter_test_chat1/injection/visit/countries/countries_injection.dart';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

Future<void> inti() async {
  sl.registerLazySingleton(() => GlobalKey<NavigatorState>());
  //! function - Auth :
  AuthInjection().intiAuth();

  //! function - cities:
  CitiesInjection().intiCities();

//! function - Countries:
  CountriesInjection().intiCountries();

//! function - partner:
  PartnerInjection().intiPartner();

//! function -message:
  MessageInjection().intiMessage();
  // ! Feature -Global
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImplemntes(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());
}

BuildContext? get ctx => sl<GlobalKey<NavigatorState>>().currentContext;
