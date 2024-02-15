import 'package:dartz/dartz.dart';
import 'package:flutter_test_chat1/core/error/failure.dart';
import 'package:flutter_test_chat1/feautres/ragion/Country/data/model/res/response_countries_model.dart';
import 'package:flutter_test_chat1/feautres/ragion/Country/domain/repository/country_repository.dart';

class GetAllCountriesUsecases {
  final CountriesRepository countryRepository;
  GetAllCountriesUsecases({required this.countryRepository});

  Future<Either<Failure, List<CountriesResult>>> call() async {
    return await countryRepository.getAllCountries();
  }
}
