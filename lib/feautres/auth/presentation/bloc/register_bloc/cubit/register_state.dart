part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final String error;
  final String success;
  final StatusCubit status;
  final String imag64;

  const RegisterState({
    required this.error,
    required this.status,
    required this.success,
    required this.imag64,
  });

  // intial Cubit
  factory RegisterState.intial() {
    return const RegisterState(
      error: '',
      success: '',
      status: StatusCubit.intial,
      imag64: '',
    );
  }
  // this is constant
  @override
  bool get stringify => true;

  @override
  List<Object> get props => [error, success, status, imag64];
  //

  // this is function to all states
  RegisterState copyWith({
    String? error,
    String? success,
    StatusCubit? status,
    String? imag64,
    int? valueSelected,
    bool? checked,
  }) {
    return RegisterState(
      error: error ?? this.error,
      success: success ?? this.success,
      status: status ?? this.status,
      imag64: imag64 ?? this.imag64,
    );
  }
}
