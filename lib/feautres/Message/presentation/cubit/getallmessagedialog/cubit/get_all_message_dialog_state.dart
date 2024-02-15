import 'package:equatable/equatable.dart';
import 'package:flutter_test_chat1/core/enum/status_enum.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/res/response_get_all_dialog.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/res/response_get_all_message.dart';

class GetAllMessageDialogState extends Equatable {
  final String error;
  final String success;
  final StatusCubit status;
  final List<DialogMessageInfoPartener> listMessage;

  const GetAllMessageDialogState({
    required this.error,
    required this.success,
    required this.status,
    required this.listMessage,
  });

  factory GetAllMessageDialogState.intial() {
    return const GetAllMessageDialogState(
      error: '',
      success: '',
      status: StatusCubit.intial,
      listMessage: [],
    );
  }
  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        error,
        success,
        status,
        listMessage,
      ];

  GetAllMessageDialogState copyWith({
    String? error,
    String? success,
    StatusCubit? status,
    List<DialogMessageInfoPartener>? listMessage,
    List<DialogMessageInfo>? meesageNow,
  }) {
    return GetAllMessageDialogState(
      error: error ?? this.error,
      success: success ?? this.success,
      status: status ?? this.status,
      listMessage: listMessage ?? this.listMessage,
    );
  }
}
