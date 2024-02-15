import 'package:dartz/dartz.dart';
import 'package:flutter_test_chat1/core/error/exception.dart';
import 'package:flutter_test_chat1/core/error/failure.dart';
import 'package:flutter_test_chat1/core/network/network_info.dart';
import 'package:flutter_test_chat1/core/strings/failure.dart';
import 'package:flutter_test_chat1/feautres/auth/data/datasource/remote/auth_remote.dart';
import 'package:flutter_test_chat1/feautres/auth/data/model/req/login_request_model.dart';
import 'package:flutter_test_chat1/feautres/auth/data/model/req/register_request_model.dart';
import 'package:flutter_test_chat1/feautres/auth/data/model/res/image_response_model.dart';
import 'package:flutter_test_chat1/feautres/auth/data/model/res/login_responce_model.dart';
import 'package:flutter_test_chat1/feautres/auth/data/model/res/register_responce_model.dart';
import 'package:flutter_test_chat1/feautres/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfo networkInformation;
  final AuthRemote authRemote;

  AuthRepositoryImpl({
    required this.networkInformation,
    required this.authRemote,
  });
  //! Register
  @override
  Future<Either<Failure, RegisterResponse>> register({
    required RegisterRequest registerModel,
  }) async {
    if (await networkInformation.isConnected) {
      try {
        final registerData =
            await authRemote.register(registerModel: registerModel);
        return Right(registerData);
      } on ServerException catch (e) {
        return Left(Failure(
            error: FaluireWord.serverFaluireMessage, response: e.response));
      }
    } else {
      return const Left(Failure(error: FaluireWord.offlineFailureMessage));
    }
  }
  //!

  //! login
  @override
  Future<Either<Failure, LoginResponse>> login(
      {required LoginRequest loginModel}) async {
    if (await networkInformation.isConnected) {
      try {
        final loginData = await authRemote.login(loginModle: loginModel);
        return Right(loginData);
      } on ServerException catch (e) {
        return Left(Failure(
            error: FaluireWord.serverFaluireMessage, response: e.response));
      }
    } else {
      return const Left(Failure(error: FaluireWord.offlineFailureMessage));
    }
  }
  //!

  //! image
  @override
  Future<Either<Failure, ImageResponse>> image({required int id}) async {
    if (await networkInformation.isConnected) {
      try {
        final imageData = await authRemote.image(id: id);
        return Right(imageData);
      } on ServerException catch (e) {
        return Left(Failure(
            error: FaluireWord.serverFaluireMessage, response: e.response));
      }
    } else {
      return const Left(Failure(error: FaluireWord.offlineFailureMessage));
    }
  }
  //!
}
