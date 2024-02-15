import 'package:dartz/dartz.dart';
import 'package:flutter_test_chat1/core/error/failure.dart';
import 'package:flutter_test_chat1/feautres/ragion/Cities/data/model/res/response_cities_model.dart';

abstract class CitiesRepository {
  Future<Either<Failure, List<Cities>>> getAllCities();
}
