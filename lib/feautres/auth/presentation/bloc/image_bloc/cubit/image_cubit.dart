import 'package:bloc/bloc.dart';
import 'package:flutter_test_chat1/core/enum/status_enum.dart';
import 'package:flutter_test_chat1/core/shared/sharedPrefrances/shared_pref.dart';
import 'package:flutter_test_chat1/core/strings/failure.dart';
import 'package:flutter_test_chat1/feautres/auth/domain/usecases/usecase_auth.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/bloc/image_bloc/cubit/image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit({required this.imageUseCases}) : super(ImageState.intial());
  final UsecaseAuth imageUseCases;

  Future<void> getImage({required int id}) async {
    var imageData = await imageUseCases.image(id: id);
    imageData.fold(
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
        //! cach image partener
        AppSharedPreferences.cachePartenerImage(
          partenerImage: done.imageBase64,
        );
        emit(state.copyWith(
          image: done.imageBase64,
          status: StatusCubit.done,
        ));
      },
    );
  }
}
