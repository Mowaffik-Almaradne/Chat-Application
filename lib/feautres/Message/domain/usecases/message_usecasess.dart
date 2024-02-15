import 'package:dartz/dartz.dart';
import 'package:flutter_test_chat1/core/error/failure.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/req/request_message_model.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/res/response_message_model.dart';
import 'package:flutter_test_chat1/feautres/Message/domain/repository/message_repositoy.dart';

class MessageUseCases {
  MessageRepository messageRepositry;
  MessageUseCases({required this.messageRepositry});
  //! sendMessage
  Future<Either<Failure, ResponseMessageInfo>> call({
    required MessageRequest messageModel,
  }) async {
    return await messageRepositry.sendMessage(messageModel: messageModel);
  }
  //!
}
