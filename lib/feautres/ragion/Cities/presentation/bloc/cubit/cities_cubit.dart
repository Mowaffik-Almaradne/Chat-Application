import 'package:bloc/bloc.dart';
import 'package:flutter_test_chat1/core/error/failure.dart';
import 'package:flutter_test_chat1/core/enum/status_enum.dart';
import 'package:flutter_test_chat1/core/strings/failure.dart';
import 'package:flutter_test_chat1/feautres/ragion/Cities/domain/usecases/cities_usecases.dart';
import 'package:flutter_test_chat1/feautres/ragion/Cities/presentation/bloc/cubit/cities_state.dart';

class CitiesCubit extends Cubit<CitiesState> {
  final GetAllCitiesUseCases getAllCitiesUseCases;

  CitiesCubit({required this.getAllCitiesUseCases})
      : super(CitiesState.intial());
  Future<void> getAllCities() async {
    emit(state.copyWith(status: StatusCubit.loading, cities: []));

    final citiesData = await getAllCitiesUseCases();
    citiesData.fold(
      (failure) {
        faliureMethode(failure);
      },
      (city) {
        emit(state.copyWith(
          status: StatusCubit.done,
          cities: city,
        ));
      },
    );
  }

//! this is function failure
  void faliureMethode(Failure failure) {
    if (failure.error == FaluireWord.serverFaluireMessage) {
      emit(state.copyWith(
          status: StatusCubit.failed, error: failure.response!.body));
    } else {
      emit(state.copyWith(
          status: StatusCubit.failed,
          error: FaluireWord.offlineFailureMessage));
    }
  }
}
