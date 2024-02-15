import 'package:dartz/dartz.dart';
import 'package:flutter_test_chat1/core/error/failure.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/req/request_fire_base_model.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/res/response_fire_base.dart';
import 'package:flutter_test_chat1/feautres/Message/domain/repository/message_repositoy.dart';

class FireBaseTokenUseCases {
  final MessageRepository messageRepositoryFireBaseToken;
  FireBaseTokenUseCases({required this.messageRepositoryFireBaseToken});

  Future<Either<Failure, FireBaseInfo>> call({
    required FireBaseTokenRequest tokenModel,
  }) async {
    return await messageRepositoryFireBaseToken.sendFireBaseToken(
      tokenModel: tokenModel,
    );
  }
}
