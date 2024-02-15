import 'package:dartz/dartz.dart';
import 'package:flutter_test_chat1/core/error/exception.dart';
import 'package:flutter_test_chat1/core/error/failure.dart';
import 'package:flutter_test_chat1/core/network/network_info.dart';
import 'package:flutter_test_chat1/feautres/ragion/Cities/data/datasource/remote/cities_remote.dart';
import 'package:flutter_test_chat1/feautres/ragion/Cities/data/model/res/response_cities_model.dart';
import 'package:flutter_test_chat1/feautres/ragion/Cities/domain/repository/cities_repository.dart';

class CitiesRepositoryImpl implements CitiesRepository {
  CitiesRepositoryImpl({
    required this.citiesRemote,
    required this.networkInformation,
  });
  final NetworkInfo networkInformation;
  final CitiesRemote citiesRemote;
  @override
  Future<Either<Failure, List<Cities>>> getAllCities() async {
    if (await networkInformation.isConnected) {
      try {
        final citiesData = await citiesRemote.getAllCities();
        return Right(citiesData);
      } on ServerException catch (e) {
        return Left(Failure(error: 'server Exception', response: e.response));
      }
    } else {
      return const Left(Failure(error: 'no Internet Connection'));
    }
  }
}
