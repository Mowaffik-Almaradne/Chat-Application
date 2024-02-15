class CititesResponse {
  CititesResponse({
    required this.result,
  });

  final List<Cities> result;

  factory CititesResponse.fromJson(Map<String, dynamic> json) {
    return CititesResponse(
      result: json["result"] == null
          ? []
          : List<Cities>.from(json["result"]!.map((x) => Cities.fromJson(x))),
    );
  }
}

//! this is target response :
class Cities {
  Cities({
    required this.countryId,
    required this.countryName,
    required this.name,
    required this.id,
  });

  final int countryId;
  final String countryName;
  final String name;
  final int id;

  factory Cities.fromJson(Map<String, dynamic> json) {
    return Cities(
      countryId: json["countryId"] ?? 0,
      countryName: json["countryName"] ?? "",
      name: json["name"] ?? "",
      id: json["id"] ?? 0,
    );
  }
}
