import 'package:bloc/bloc.dart';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';
import 'package:flutter_test_chat1/core/enum/status_enum.dart';
import 'package:flutter_test_chat1/core/shared/sharedPrefrances/shared_pref.dart';
import 'package:flutter_test_chat1/core/strings/failure.dart';
import 'package:flutter_test_chat1/feautres/Message/domain/usecases/get_all_messages_usecases.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/cubit/getallmessagebloc/cubit/getallmessage_state.dart';

class GetAllMessagesCubti extends Cubit<GetAllMessagesState> {
  final GetAllMessagesUseCases getAllMessageUseCases;
  GetAllMessagesCubti({
    required this.getAllMessageUseCases,
  }) : super(GetAllMessagesState.intial());

  //! function sendData
  Future<void> getAllMessage() async {
    emit(state.copyWith(status: StatusCubit.loading));
    var getAllMessageData = await getAllMessageUseCases();
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
        AppSharedPreferences.cachePartenerIdListString(messagesId: done);
        emit(state.copyWith(
          status: StatusCubit.done,
          success: FaluireWord.successfulyMessage,
          listMessage: done,
        ));
      },
    );
  }

//! change color icon send
  changeColor(String text) {
    if (text.isNotEmpty) {
      emit(state.copyWith(changeColor: AppColors.primaryColor));
    } else {
      emit(state.copyWith(changeColor: AppColors.subColor));
    }
  }
}
