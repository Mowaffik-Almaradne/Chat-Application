import 'package:equatable/equatable.dart';
import 'package:flutter_test_chat1/core/enum/status_enum.dart';
import 'package:flutter_test_chat1/feautres/ragion/Cities/data/model/res/response_cities_model.dart';


class CitiesState extends Equatable {
  final String error;
  final String success;
  final StatusCubit status;
  final List<Cities> cities;
  const CitiesState({
    required this.error,
    required this.status,
    required this.success,
    required this.cities,
  });

  // intial Cubit
  factory CitiesState.intial() {
    return const CitiesState(
      error: '',
      success: '',
      status: StatusCubit.intial,
      cities: [],
    );
  }
  // this is constant
  @override
  bool get stringify => true;

  @override
  List<Object> get props => [error, status, success, cities];
  //

  //! this is function to all states
  CitiesState copyWith({
    String? error,
    String? success,
    StatusCubit? status,
    List<Cities>? cities,
  }) {
    return CitiesState(
      error: error ?? this.error,
      success: success ?? this.success,
      status: status ?? this.status,
      cities: cities ?? this.cities,
    );
  }
}
