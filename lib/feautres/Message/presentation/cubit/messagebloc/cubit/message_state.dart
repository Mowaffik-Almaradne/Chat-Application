import 'package:equatable/equatable.dart';
import 'package:flutter_test_chat1/core/enum/status_enum.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/req/request_message_model.dart';

class MessageState extends Equatable {
  final String error;
  final String success;
  final StatusCubit status;
  final MessageRequest message;

  const MessageState({
    required this.error,
    required this.success,
    required this.status,
    required this.message,
  });

  factory MessageState.intial() {
    return MessageState(
      error: '',
      success: '',
      status: StatusCubit.intial,
      message: MessageRequest(
          recipientId: 0, who: 0, message: '', time: DateTime.now()),
    );
  }
  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [error, success, status, message];

  MessageState copyWith({
    String? error,
    String? success,
    StatusCubit? status,
    MessageRequest? message,
  }) {
    return MessageState(
      error: error ?? this.error,
      success: success ?? this.success,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
