import 'package:dartz/dartz.dart';
import 'package:flutter_test_chat1/core/error/failure.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/res/response_get_all_dialog.dart';
import 'package:flutter_test_chat1/feautres/Message/domain/repository/message_repositoy.dart';

class GetAllMessageDialogUseCases {
  GetAllMessageDialogUseCases({required this.getAllMessageDilaog});
  MessageRepository getAllMessageDilaog;
  Future<Either<Failure, List<DialogMessageInfoPartener>>> call() async {
    return await getAllMessageDilaog.getAllMessageDialog();
  }
}
