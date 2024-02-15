import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test_chat1/core/enum/status_enum.dart';
import 'package:flutter_test_chat1/core/strings/failure.dart';
import 'package:flutter_test_chat1/feautres/auth/data/model/req/register_request_model.dart';
import 'package:flutter_test_chat1/feautres/auth/domain/usecases/usecase_auth.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final UsecaseAuth registerUseCases;
  RegisterCubit({
    required this.registerUseCases,
  }) : super(RegisterState.intial());

  //!  function register
  Future<void> register({required RegisterRequest registerModel}) async {
    emit(state.copyWith(status: StatusCubit.loading));
    var registerData =
        await registerUseCases.register(registerModel: registerModel);
    registerData.fold((failure) {
      if (failure.error == FaluireWord.serverFaluireMessage) {
        emit(state.copyWith(
            status: StatusCubit.failed,
            error: FaluireWord.serverFaluireMessage));
      } else {
        emit(state.copyWith(
          status: StatusCubit.failed,
          error: FaluireWord.offlineFailureMessage,
        ));
      }
    }, (done) {
      emit(state.copyWith(
        status: StatusCubit.done,
        success: FaluireWord.successfulyMessage,
      ));
    });
  }

//? function getImage
  Future<void> getImage() async {
    var picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      final bytes = await file.readAsBytes();
      final base64Image = base64Encode(bytes);
      emit(state.copyWith(
        imag64: base64Image,
      ));
    }
  }
}
