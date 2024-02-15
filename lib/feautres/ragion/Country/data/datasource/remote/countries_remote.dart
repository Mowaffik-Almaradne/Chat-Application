
import 'package:flutter_test_chat1/core/api/api_links.dart';
import 'package:flutter_test_chat1/core/api/api_methods.dart';
import 'package:flutter_test_chat1/core/error/exception.dart';
import 'package:flutter_test_chat1/core/extensions/extensions.dart';
import 'package:flutter_test_chat1/feautres/ragion/Country/data/model/res/response_countries_model.dart';

abstract class CountriesRemote {
  Future<List<CountriesResult>> getAllCountries();
}

class CountriesRemoteImpl extends CountriesRemote {
  @override
  Future<List<CountriesResult>> getAllCountries() async {
    var response = await ApiMethods().get(
      url: ApiGet.getAllCountriesUrl,
      query: {},
      path: {},
    );
    if (response.statusCode == 200) {
      return CountriesResponse.fromJson(response.jsonBody).result;
    } else {
      throw ServerException(response: response);
    }
  }
}
