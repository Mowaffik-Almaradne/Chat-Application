import 'package:bloc/bloc.dart';
import 'package:flutter_test_chat1/core/enum/status_enum.dart';
import 'package:flutter_test_chat1/core/strings/failure.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/req/request_message_model.dart';
import 'package:flutter_test_chat1/feautres/Message/domain/usecases/message_usecasess.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/cubit/messagebloc/cubit/message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  final MessageUseCases messageUseCases;
  MessageCubit({
    required this.messageUseCases,
  }) : super(MessageState.intial());

  //! function sendData
  Future<void> sendMessage({required MessageRequest messageModel}) async {
    emit(state.copyWith(status: StatusCubit.loading));
    var sendMessageData = await messageUseCases(messageModel: messageModel);
    sendMessageData.fold(
      (faluire) {
        if (faluire.error == FaluireWord.serverFaluireMessage) {
          emit(state.copyWith(
            error: FaluireWord.serverFaluireMessage,
            status: StatusCubit.failed,
          ));
        } else {
          emit(state.copyWith(
            error: FaluireWord.offlineFailureMessage,
            status: StatusCubit.failed,
          ));
        }
      },
      (done) {
        emit(state.copyWith(
          status: StatusCubit.done,
          success: FaluireWord.successfulyMessage,
          message: messageModel,
        ));
      },
    );
  }
}
