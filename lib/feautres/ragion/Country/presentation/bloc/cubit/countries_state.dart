
import 'package:equatable/equatable.dart';
import 'package:flutter_test_chat1/core/enum/status_enum.dart';
import 'package:flutter_test_chat1/feautres/ragion/Country/data/model/res/response_countries_model.dart';

class CountriesState extends Equatable {
  final String error;
  final String success;
  final StatusCubit status;
  final List<CountriesResult> countries;
  const CountriesState({
    required this.error,
    required this.status,
    required this.success,
    required this.countries,
  });

  // intial Cubit
  factory CountriesState.intial() {
    return const CountriesState(
      error: '',
      success: '',
      status: StatusCubit.intial,
      countries: [],
    );
  }
  // this is constant
  @override
  bool get stringify => true;

  @override
  List<Object> get props => [error, status, success, countries];
  //

  // this is function to all states
  CountriesState copyWith({
    String? error,
    String? success,
    StatusCubit? status,
    List<CountriesResult>? countries,
  }) {
    return CountriesState(
      error: error ?? this.error,
      success: success ?? this.success,
      status: status ?? this.status,
      countries: countries ?? this.countries,
    );
  }
}
