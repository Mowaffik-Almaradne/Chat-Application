import 'package:bloc/bloc.dart';
import 'package:flutter_test_chat1/core/enum/status_enum.dart';
import 'package:flutter_test_chat1/core/strings/failure.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/req/request_fire_base_model.dart';
import 'package:flutter_test_chat1/feautres/Message/domain/usecases/send_fire_base_token_usecases.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/cubit/sendfirebasetoken/cubit/firebasetoken_state.dart';

class FireBaseTokenCubit extends Cubit<FireBaseTokenstate> {
  final FireBaseTokenUseCases tokenUseCases;
  FireBaseTokenCubit({
    required this.tokenUseCases,
  }) : super(FireBaseTokenstate.intial());

  //! function sendData
  Future<void> sendToken({required FireBaseTokenRequest tokenModel}) async {
    emit(state.copyWith(status: StatusCubit.loading));
    var sendeToken = await tokenUseCases(tokenModel: tokenModel);
    sendeToken.fold(
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
          token: tokenModel,
        ));
      },
    );
  }
}
