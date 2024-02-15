import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/req/request_fire_base_model.dart';
import 'package:flutter_test_chat1/feautres/auth/data/model/req/login_request_model.dart';

class VarableLogin {
  static bool remmberMe = false;
  static bool email = false;
// ? objecti to login
  static LoginRequest loginModel = LoginRequest(
    userNameOrEmailAddress: '',
    password: '',
    rememberClient: false,
  );
//? form key
  static final GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();

//? fireBase :
  static FirebaseMessaging fcm = FirebaseMessaging.instance;
//? function for insert
  static Future<FireBaseTokenRequest> insertFireBaseToken() async {
    String token = await fcm.getToken() ?? '';
    FireBaseTokenRequest tokenModel =
        FireBaseTokenRequest(firebaseToken: token);
    return tokenModel;
  }
}
