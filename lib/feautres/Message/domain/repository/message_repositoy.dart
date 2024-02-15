import 'package:dartz/dartz.dart';
import 'package:flutter_test_chat1/core/error/failure.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/req/request_fire_base_model.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/req/request_message_model.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/res/response_fire_base.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/res/response_get_all_dialog.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/res/response_get_all_message.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/res/response_message_model.dart';

abstract class MessageRepository {
  //! send Message
  Future<Either<Failure, ResponseMessageInfo>> sendMessage({
    required MessageRequest messageModel,
  });
  //!
  //! get All Messages
  Future<Either<Failure, List<DialogMessageInfo>>> getAllMessages();
  //!

  //! get All Messages Dialog
  Future<Either<Failure, List<DialogMessageInfoPartener>>>
      getAllMessageDialog();
  //!

  //! fire base token
  Future<Either<Failure, FireBaseInfo>> sendFireBaseToken({
    required FireBaseTokenRequest tokenModel,
  });

  //!
}
