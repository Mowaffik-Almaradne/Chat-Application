import 'package:equatable/equatable.dart';
import 'package:flutter_test_chat1/core/enum/status_enum.dart';

class ImageState extends Equatable {
  final String error;
  final String success;
  final StatusCubit status;
  final String image;
  const ImageState({
    required this.error,
    required this.success,
    required this.status,
    required this.image,
  });

  factory ImageState.intial() {
    return const ImageState(
      error: '',
      success: '',
      status: StatusCubit.intial,
      image: '',
    );
  }
  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [error, success, status, image];

//! function cubit
  ImageState copyWith({
    String? error,
    String? success,
    StatusCubit? status,
    String? image,
  }) {
    return ImageState(
      error: error ?? this.error,
      success: success ?? this.success,
      status: status ?? this.status,
      image: image ?? this.image,
    );
  }
}
