import 'package:dartz/dartz.dart';
import 'package:flutter_test_chat1/core/error/exception.dart';
import 'package:flutter_test_chat1/core/error/failure.dart';
import 'package:flutter_test_chat1/core/network/network_info.dart';
import 'package:flutter_test_chat1/core/strings/failure.dart';
import 'package:flutter_test_chat1/feautres/Message/data/datasource/remote/message_remote.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/req/request_fire_base_model.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/req/request_message_model.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/res/response_fire_base.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/res/response_get_all_dialog.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/res/response_get_all_message.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/res/response_message_model.dart';
import 'package:flutter_test_chat1/feautres/Message/domain/repository/message_repositoy.dart';

class MessageRepositoryImpl implements MessageRepository {
  final NetworkInfo networkInformation;
  final MessageRemote messageRemote;
  MessageRepositoryImpl({
    required this.networkInformation,
    required this.messageRemote,
  });
  //! send message
  @override
  Future<Either<Failure, ResponseMessageInfo>> sendMessage({
    required MessageRequest messageModel,
  }) async {
    if (await networkInformation.isConnected) {
      try {
        final sendMessageData =
            await messageRemote.sendMessage(messageModel: messageModel);
        return Right(sendMessageData);
      } on ServerException catch (e) {
        return Left(Failure(
          error: FaluireWord.serverFaluireMessage,
          response: e.response,
        ));
      }
    } else {
      return const Left(Failure(error: FaluireWord.offlineFailureMessage));
    }
  }

//!
//! getAllMessages
  @override
  Future<Either<Failure, List<DialogMessageInfo>>> getAllMessages() async {
    if (await networkInformation.isConnected) {
      try {
        final getAllMessageData = await messageRemote.getAllMessages();
        return Right(getAllMessageData);
      } on ServerException catch (e) {
        return Left(Failure(
          error: FaluireWord.serverFaluireMessage,
          response: e.response,
        ));
      }
    } else {
      return const Left(Failure(error: FaluireWord.offlineFailureMessage));
    }
  }

//!
//! get All Messages Dialog
  @override
  Future<Either<Failure, List<DialogMessageInfoPartener>>>
      getAllMessageDialog() async {
    if (await networkInformation.isConnected) {
      try {
        final getAllMessageDialog = await messageRemote.getAllMesageDialog();
        return Right(getAllMessageDialog);
      } on ServerException catch (e) {
        return Left(Failure(
            error: FaluireWord.serverFaluireMessage, response: e.response));
      }
    } else {
      return left(const Failure(error: FaluireWord.offlineFailureMessage));
    }
  }
  //!

//! send fire base token
  @override
  Future<Either<Failure, FireBaseInfo>> sendFireBaseToken({
    required FireBaseTokenRequest tokenModel,
  }) async {
    if (await networkInformation.isConnected) {
      try {
        final sendFireBaseToken =
            await messageRemote.sendFireBaseToken(tokenModel: tokenModel);
        return Right(sendFireBaseToken);
      } on ServerException catch (e) {
        return Left(Failure(
            error: FaluireWord.serverFaluireMessage, response: e.response));
      }
    } else {
      return left(const Failure(error: FaluireWord.offlineFailureMessage));
    }
  } //!
}
