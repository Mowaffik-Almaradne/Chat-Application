import 'package:dartz/dartz.dart';
import 'package:flutter_test_chat1/core/error/failure.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/res/response_get_all_message.dart';
import 'package:flutter_test_chat1/feautres/Message/domain/repository/message_repositoy.dart';

class GetAllMessagesUseCases {
  MessageRepository getAllMessagesRepository;
  GetAllMessagesUseCases({required this.getAllMessagesRepository});

  //! getAllMessages
  Future<Either<Failure, List<DialogMessageInfo>>> call() async {
    return await getAllMessagesRepository.getAllMessages();
  }
  //!
}
