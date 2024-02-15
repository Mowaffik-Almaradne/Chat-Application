
import 'package:flutter_test_chat1/feautres/ragion/Cities/data/datasource/remote/cities_remote.dart';
import 'package:flutter_test_chat1/feautres/ragion/Cities/data/repository/cities_repository_impl.dart';
import 'package:flutter_test_chat1/feautres/ragion/Cities/domain/repository/cities_repository.dart';
import 'package:flutter_test_chat1/feautres/ragion/Cities/domain/usecases/cities_usecases.dart';
import 'package:flutter_test_chat1/feautres/ragion/Cities/presentation/bloc/cubit/cities_cubit.dart';
import 'package:flutter_test_chat1/injection/injection_container.dart';

class CitiesInjection {
  Future<void> intiCities() async {
    // feature - Cities //
// Bloc:
    sl.registerFactory(() => CitiesCubit(getAllCitiesUseCases: sl()));

// UseCase:
    sl.registerLazySingleton(() => GetAllCitiesUseCases(repository: sl()));

// Repo:
    sl.registerLazySingleton<CitiesRepository>(() =>
        CitiesRepositoryImpl(citiesRemote: sl(), networkInformation: sl()));

// Remote:
    sl.registerLazySingleton<CitiesRemote>(() => CitiesRemoteImpl());
  }
}
