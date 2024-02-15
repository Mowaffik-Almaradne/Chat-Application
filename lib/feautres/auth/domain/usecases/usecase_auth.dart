import 'package:dartz/dartz.dart';
import 'package:flutter_test_chat1/core/error/failure.dart';
import 'package:flutter_test_chat1/feautres/auth/data/model/req/login_request_model.dart';
import 'package:flutter_test_chat1/feautres/auth/data/model/req/register_request_model.dart';
import 'package:flutter_test_chat1/feautres/auth/data/model/res/image_response_model.dart';
import 'package:flutter_test_chat1/feautres/auth/data/model/res/login_responce_model.dart';
import 'package:flutter_test_chat1/feautres/auth/data/model/res/register_responce_model.dart';
import 'package:flutter_test_chat1/feautres/auth/domain/usecases/base_usecase_auth.dart';
import '../repository/auth_repository.dart';

class UsecaseAuth implements AuthBaseUsecase {
  final AuthRepository repository;
  UsecaseAuth({required this.repository});

//! image UseCaes :
  @override
  Future<Either<Failure, ImageResponse>> image({required int id}) async {
    return await repository.image(id: id);
  }

//! login useCase :
  @override
  Future<Either<Failure, LoginResponse>> login(
      {required LoginRequest loginModel}) async {
    return await repository.login(loginModel: loginModel);
  }

//! register use case :
  @override
  Future<Either<Failure, RegisterResponse>> register(
      {required RegisterRequest registerModel}) async {
    return await repository.register(registerModel: registerModel);
  }
}
