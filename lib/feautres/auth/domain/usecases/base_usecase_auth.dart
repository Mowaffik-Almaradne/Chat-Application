import 'package:dartz/dartz.dart';
import 'package:flutter_test_chat1/core/error/failure.dart';
import 'package:flutter_test_chat1/feautres/auth/data/model/req/login_request_model.dart';
import 'package:flutter_test_chat1/feautres/auth/data/model/req/register_request_model.dart';
import 'package:flutter_test_chat1/feautres/auth/data/model/res/image_response_model.dart';
import 'package:flutter_test_chat1/feautres/auth/data/model/res/login_responce_model.dart';
import 'package:flutter_test_chat1/feautres/auth/data/model/res/register_responce_model.dart';

abstract class AuthBaseUsecase {
  //! register
  Future<Either<Failure, RegisterResponse>> register({
    required RegisterRequest registerModel,
  });
  //!

//! login
  Future<Either<Failure, LoginResponse>> login({
    required LoginRequest loginModel,
  });
  //!

  //! image
  Future<Either<Failure, ImageResponse>> image({required int id});
  //!
}
