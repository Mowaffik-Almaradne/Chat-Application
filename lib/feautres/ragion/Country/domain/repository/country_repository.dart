import 'package:dartz/dartz.dart';
import 'package:flutter_test_chat1/core/error/failure.dart';
import 'package:flutter_test_chat1/feautres/ragion/Country/data/model/res/response_countries_model.dart';

abstract class CountriesRepository {
  Future<Either<Failure, List<CountriesResult>>> getAllCountries();
}
