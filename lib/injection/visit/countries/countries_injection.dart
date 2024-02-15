
import 'package:flutter_test_chat1/feautres/ragion/Country/data/datasource/remote/countries_remote.dart';
import 'package:flutter_test_chat1/feautres/ragion/Country/data/repository/countries_repository_impl.dart';
import 'package:flutter_test_chat1/feautres/ragion/Country/domain/repository/country_repository.dart';
import 'package:flutter_test_chat1/feautres/ragion/Country/domain/usecases/countries_usecases.dart';
import 'package:flutter_test_chat1/feautres/ragion/Country/presentation/bloc/cubit/countries_cubit.dart';
import 'package:flutter_test_chat1/injection/injection_container.dart';

class CountriesInjection {
  Future<void> intiCountries() async {
    //? feature - Countries 

//! Bloc
    sl.registerFactory(() => CountriesCubit(getAllCountriesUsecases: sl()));

//! UseCase
    sl.registerLazySingleton(
        () => GetAllCountriesUsecases(countryRepository: sl()));

    //! Repo
    sl.registerLazySingleton<CountriesRepository>(() => CountriesRepositoryImpl(
        networkInformation: sl(), countriesRemote: sl()));

//! Remote
    sl.registerLazySingleton<CountriesRemote>(() => CountriesRemoteImpl());
    //! local
  }
}
