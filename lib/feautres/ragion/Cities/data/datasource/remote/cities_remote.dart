
import 'package:flutter_test_chat1/core/api/api_links.dart';
import 'package:flutter_test_chat1/core/api/api_methods.dart';
import 'package:flutter_test_chat1/core/error/exception.dart';
import 'package:flutter_test_chat1/core/extensions/extensions.dart';
import 'package:flutter_test_chat1/feautres/ragion/Cities/data/model/res/response_cities_model.dart';

abstract class CitiesRemote {
  Future<List<Cities>> getAllCities();
}

class CitiesRemoteImpl implements CitiesRemote {
  @override
  Future<List<Cities>> getAllCities() async {
    var response = await ApiMethods().get(
      url: ApiGet.getAllCitiesUrl,
      query: {},
      path: {},
    );
    if (response.statusCode == 200) {
      return CititesResponse.fromJson(response.jsonBody).result;
    } else {
      throw ServerException(response: response);
    }
  }
}
