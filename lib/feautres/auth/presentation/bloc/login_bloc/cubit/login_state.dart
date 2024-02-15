import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_chat1/core/Utils/helper/color/color_helper.dart';
import 'package:flutter_test_chat1/core/enum/status_enum.dart';


class LoginState extends Equatable {
  final String error;
  final String success;
  final StatusCubit status;
  final Color colorIcon;
  const LoginState({
    required this.error,
    required this.success,
    required this.status,
    required this.colorIcon,
  });

  factory LoginState.intial() {
    return LoginState(
      error: '',
      success: '',
      status: StatusCubit.intial,
      colorIcon: AppColors.subColor,
    );
  }
  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [error, success, status, colorIcon];

  LoginState copyWith({
    String? error,
    String? success,
    StatusCubit? status,
    Color? colorIcon,
  }) {
    return LoginState(
      error: error ?? this.error,
      success: success ?? this.success,
      status: status ?? this.status,
      colorIcon: colorIcon ?? this.colorIcon,
    );
  }
}
