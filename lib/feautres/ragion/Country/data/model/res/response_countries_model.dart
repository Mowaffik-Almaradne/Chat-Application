class CountriesResponse {
  CountriesResponse({
    required this.result,
  });

  final List<CountriesResult> result;

  factory CountriesResponse.fromJson(Map<String, dynamic> json) {
    return CountriesResponse(
      result: json["result"] == null
          ? []
          : List<CountriesResult>.from(
              json["result"]!.map((x) => CountriesResult.fromJson(x),)),
    );
  }
}

//! this is target :
class CountriesResult {
  CountriesResult({
    required this.name,
    required this.cities,
    required this.id,
  });

  final String name;
  final List<Countries> cities;
  final int id;

  factory CountriesResult.fromJson(Map<String, dynamic> json) {
    return CountriesResult(
      name: json["name"] ?? "",
      cities: json["cities"] == null
          ? []
          : List<Countries>.from(
              json["cities"]!.map((x) => Countries.fromJson(x))),
      id: json["id"] ?? 0,
    );
  }
}

class Countries {
  Countries({
    required this.countryId,
    required this.countryName,
    required this.name,
    required this.id,
  });

  final int countryId;
  final String countryName;
  final String name;
  final int id;

  factory Countries.fromJson(Map<String, dynamic> json) {
    return Countries(
      countryId: json["countryId"] ?? 0,
      countryName: json["countryName"] ?? "",
      name: json["name"] ?? "",
      id: json["id"] ?? 0,
    );
  }
}
