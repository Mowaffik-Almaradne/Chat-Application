import 'dart:convert';

import 'package:flutter_test_chat1/core/api/api_links.dart';
import 'package:flutter_test_chat1/core/api/api_methods.dart';
import 'package:flutter_test_chat1/core/error/exception.dart';
import 'package:flutter_test_chat1/core/extensions/extensions.dart';
import 'package:flutter_test_chat1/feautres/auth/data/model/req/login_request_model.dart';
import 'package:flutter_test_chat1/feautres/auth/data/model/req/register_request_model.dart';
import 'package:flutter_test_chat1/feautres/auth/data/model/res/image_response_model.dart';
import 'package:flutter_test_chat1/feautres/auth/data/model/res/login_responce_model.dart';
import 'package:flutter_test_chat1/feautres/auth/data/model/res/register_responce_model.dart';

//? interface
abstract class AuthRemote {
  Future<RegisterResponse> register({required RegisterRequest registerModel});
  Future<LoginResponse> login({required LoginRequest loginModle});
  Future<ImageResponse> image({required int id});
}

//!  AuthRemote Implemention :
class AuthRemoteImpl extends AuthRemote {
  //! Register
  @override
  Future<RegisterResponse> register(
      {required RegisterRequest registerModel}) async {
    var response = await ApiMethods().post(
      url: ApiPost.rigesterUrl,
      body: registerModel.toJson(),
      query: {},
    );

    if (response.statusCode == 200) {
      return RegisterResponse.fromJson(response.jsonBody);
    } else {
      throw ServerException(response: response);
    }
  }
  //!

  //! login
  @override
  Future<LoginResponse> login({required LoginRequest loginModle}) async {
    var response = await ApiMethods().post(
      url: ApiPost.loginUrl,
      body: loginModle.toJson(),
      query: {},
    );

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(response.jsonBody);
    } else {
      throw ServerException(response: response,);
    }
  }
  //!

//! image
  @override
  Future<ImageResponse> image({required int id}) async {
    var response = await ApiMethods().get(
      url: '${ApiGet.getImageUrl}$id',
      query: {},
      path: {},
    );

    if (response.statusCode == 200) {
      String imageBase64 = base64Encode(response.bodyBytes);
      return ImageResponse(imageBase64: imageBase64);
    } else {
      throw ServerException(response: response);
    }
  } //!
}
