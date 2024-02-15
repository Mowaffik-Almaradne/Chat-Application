import 'package:dartz/dartz.dart';
import 'package:flutter_test_chat1/core/error/exception.dart';
import 'package:flutter_test_chat1/core/error/failure.dart';
import 'package:flutter_test_chat1/core/network/network_info.dart';
import 'package:flutter_test_chat1/core/strings/failure.dart';
import 'package:flutter_test_chat1/feautres/ragion/Country/data/datasource/remote/countries_remote.dart';
import 'package:flutter_test_chat1/feautres/ragion/Country/data/model/res/response_countries_model.dart';
import 'package:flutter_test_chat1/feautres/ragion/Country/domain/repository/country_repository.dart';

class CountriesRepositoryImpl extends CountriesRepository {
  final NetworkInfo networkInformation;
  final CountriesRemote countriesRemote;

  CountriesRepositoryImpl({
    required this.networkInformation,
    required this.countriesRemote,
  });

  @override
  Future<Either<Failure, List<CountriesResult>>> getAllCountries() async {
    if (await networkInformation.isConnected) {
      try {
        final countriesData = await countriesRemote.getAllCountries();
        return Right(countriesData);
      } on ServerException catch (e) {
        return Left(Failure(
            response: e.response, error: FaluireWord.serverFaluireMessage));
      }
    } else {
      return const Left(Failure(error: FaluireWord.offlineFailureMessage));
    }
  }
}
