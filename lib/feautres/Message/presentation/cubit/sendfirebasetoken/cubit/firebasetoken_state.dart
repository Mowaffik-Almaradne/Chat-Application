import 'package:equatable/equatable.dart';
import 'package:flutter_test_chat1/core/enum/status_enum.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/req/request_fire_base_model.dart';

class FireBaseTokenstate extends Equatable {
  final String error;
  final String success;
  final StatusCubit status;
  final FireBaseTokenRequest token;

  const FireBaseTokenstate({
    required this.error,
    required this.success,
    required this.status,
    required this.token,
  });

  factory FireBaseTokenstate.intial() {
    return FireBaseTokenstate(
      error: '',
      success: '',
      status: StatusCubit.intial,
      token: FireBaseTokenRequest(firebaseToken: ''),
    );
  }
  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [error, success, status, token];

  FireBaseTokenstate copyWith({
    String? error,
    String? success,
    StatusCubit? status,
    FireBaseTokenRequest? token,
  }) {
    return FireBaseTokenstate(
      error: error ?? this.error,
      success: success ?? this.success,
      status: status ?? this.status,
      token: token ?? this.token,
    );
  }
}
