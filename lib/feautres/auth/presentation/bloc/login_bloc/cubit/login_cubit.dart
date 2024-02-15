import 'package:bloc/bloc.dart';
import 'package:flutter_test_chat1/core/enum/status_enum.dart';
import 'package:flutter_test_chat1/core/shared/sharedPrefrances/shared_pref.dart';
import 'package:flutter_test_chat1/core/strings/failure.dart';
import 'package:flutter_test_chat1/feautres/auth/data/model/req/login_request_model.dart';
import 'package:flutter_test_chat1/feautres/auth/domain/usecases/usecase_auth.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/bloc/login_bloc/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final UsecaseAuth loginUseCases;
  LoginCubit({required this.loginUseCases}) : super(LoginState.intial());

  //! function login
  Future<void> login({required LoginRequest loginModel}) async {
    emit(state.copyWith(status: StatusCubit.loading));
    var loginData = await loginUseCases.login(loginModel: loginModel);
    loginData.fold(
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
        AppSharedPreferences.cacheAuthUserInfo(
          accToken: done.result.accessToken,
          userId: done.result.userId,
        );
        emit(state.copyWith(
          status: StatusCubit.done,
          success: FaluireWord.successfulyMessage,
        ));
      },
    );
  }
}
