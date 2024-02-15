import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';
import 'package:flutter_test_chat1/core/enum/status_enum.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/res/response_get_all_message.dart';

class GetAllMessagesState extends Equatable {
  final String error;
  final String success;
  final StatusCubit status;
  final List<DialogMessageInfo> listMessage;
  final Color changeColor;

  const GetAllMessagesState({
    required this.error,
    required this.success,
    required this.status,
    required this.listMessage,
    required this.changeColor,
  });

  factory GetAllMessagesState.intial() {
    return GetAllMessagesState(
      error: '',
      success: '',
      status: StatusCubit.intial,
      listMessage: const [],
      changeColor: AppColors.subColor,
    );
  }
  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [error, success, status, listMessage, changeColor];

  GetAllMessagesState copyWith({
    String? error,
    String? success,
    StatusCubit? status,
    List<DialogMessageInfo>? listMessage,
    Color? changeColor,
  }) {
    return GetAllMessagesState(
      error: error ?? this.error,
      success: success ?? this.success,
      status: status ?? this.status,
      listMessage: listMessage ?? this.listMessage,
      changeColor: changeColor ?? this.changeColor,
    );
  }
}
