import 'package:bloc/bloc.dart';
import 'package:flutter_test_chat1/core/enum/status_enum.dart';
import 'package:flutter_test_chat1/core/strings/failure.dart';
import 'package:flutter_test_chat1/feautres/Message/domain/usecases/get_all_message_dialog_usecases.dart';

import 'package:flutter_test_chat1/feautres/Message/presentation/cubit/getallmessagedialog/cubit/get_all_message_dialog_state.dart';

class GetAllDialogMessageCubit extends Cubit<GetAllMessageDialogState> {
  final GetAllMessageDialogUseCases getAllDialogMessageUseCases;
  GetAllDialogMessageCubit({
    required this.getAllDialogMessageUseCases,
  }) : super(GetAllMessageDialogState.intial());

  //! function sendData
  Future<void> getAllMessage() async {
    emit(state.copyWith(status: StatusCubit.loading));
    var getAllMessageData = await getAllDialogMessageUseCases();
    getAllMessageData.fold(
      (failure) {
        if (failure.error == FaluireWord.serverFaluireMessage) {
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
          listMessage: done,
        ));
      },
    );
  }
}
