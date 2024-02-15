import 'package:bloc/bloc.dart';
import 'package:flutter_test_chat1/core/enum/status_enum.dart';
import 'package:flutter_test_chat1/core/strings/failure.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/data/model/req/partner_request_model.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/domain/usecases/partner_usecase.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/presentation/bloc/partnerbloc/cubit/partner_state.dart';

class PartnerCubit extends Cubit<PartnerState> {
  PartnerCubit({
    required this.getAllPartnerUseCase,
  }) : super(PartnerState.intial());

  final GetAllPartnerUseCase getAllPartnerUseCase;

  Future<void> getAllPartner({required PartnerRequest partnerModel}) async {
    emit(state.copyWith(status: StatusCubit.loading));
    final partnerData = await getAllPartnerUseCase(partnerModel: partnerModel);
    partnerData.fold((faliure) {
      if (faliure.error == FaluireWord.serverFaluireMessage) {
        emit(state.copyWith(
            status: StatusCubit.failed, error: faliure.response!.body));
      } else {
        emit(state.copyWith(
            status: StatusCubit.failed,
            error: FaluireWord.offlineFailureMessage));
      }
    }, (partner) {
      emit(state.copyWith(
        status: StatusCubit.done,
        partner: partner,
      ));
    });
  }
}
