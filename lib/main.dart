import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_chat1/app/my_app.dart';
import 'package:flutter_test_chat1/core/shared/observable/bloc_observer.dart';
import 'package:flutter_test_chat1/core/shared/sharedPrefrances/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'injection/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await di.inti();
  await Firebase.initializeApp();
  SharedPreferences.getInstance().then(
    (prefs) {
      AppSharedPreferences.init(prefs);
      runApp(
        MyApp(),
      );
    },
  );
}
