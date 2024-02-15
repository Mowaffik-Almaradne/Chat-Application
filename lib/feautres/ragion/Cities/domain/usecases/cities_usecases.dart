import 'package:dartz/dartz.dart';
import 'package:flutter_test_chat1/core/error/failure.dart';
import 'package:flutter_test_chat1/feautres/ragion/Cities/data/model/res/response_cities_model.dart';
import 'package:flutter_test_chat1/feautres/ragion/Cities/domain/repository/cities_repository.dart';

class GetAllCitiesUseCases {
  final CitiesRepository repository;
  GetAllCitiesUseCases({required this.repository});

  Future<Either<Failure, List<Cities>>> call() async {
    return await repository.getAllCities();
  }
}
