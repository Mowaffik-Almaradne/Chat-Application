import 'package:equatable/equatable.dart';
import 'package:flutter_test_chat1/core/enum/status_enum.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/data/model/res/partner_response_model.dart';


class PartnerState extends Equatable {
  final String error;
  final String success;
  final StatusCubit status;
  final List<PartnerInfo> partner;
  const PartnerState({
    required this.error,
    required this.success,
    required this.status,
    required this.partner,
  });
  factory PartnerState.intial() {
    return const PartnerState(
      error: '',
      success: '',
      status: StatusCubit.intial,
      partner: [],
    );
  }
  @override
  List<Object?> get props => [error, success, status, partner];

//! this is function for all state
  PartnerState copyWith({
    String? error,
    String? success,
    StatusCubit? status,
    List<PartnerInfo>? partner,
  }) {
    return PartnerState(
      error: error ?? this.error,
      success: success ?? this.success,
      status: status ?? this.status,
      partner: partner ?? this.partner,
    );
  }
}
