import 'package:bloc/bloc.dart';
import 'package:flutter_test_chat1/core/error/failure.dart';
import 'package:flutter_test_chat1/core/enum/status_enum.dart';
import 'package:flutter_test_chat1/core/strings/failure.dart';
import 'package:flutter_test_chat1/feautres/ragion/Country/domain/usecases/countries_usecases.dart';
import 'package:flutter_test_chat1/feautres/ragion/Country/presentation/bloc/cubit/countries_state.dart';

class CountriesCubit extends Cubit<CountriesState> {
  CountriesCubit({
    required this.getAllCountriesUsecases,
  }) : super(CountriesState.intial());

//! get countrie of usecases
  final GetAllCountriesUsecases getAllCountriesUsecases;

  Future<void> getAllCountries() async {
    emit(state.copyWith(status: StatusCubit.loading, countries: []));
    final countriesData = await getAllCountriesUsecases();
    countriesData.fold((faliure) {
      faliureMethode(faliure);
    }, (countries) {
      emit(state.copyWith(
        status: StatusCubit.done,
        countries: countries,
      ));
    });
  }

//! methode faliure of server or internet
  void faliureMethode(Failure faliure) {
    if (faliure.error == FaluireWord.serverFaluireMessage) {
      emit(state.copyWith(
          status: StatusCubit.failed, error: faliure.response!.body));
    } else {
      emit(state.copyWith(
          status: StatusCubit.failed,
          error: FaluireWord.offlineFailureMessage));
    }
  }
}
