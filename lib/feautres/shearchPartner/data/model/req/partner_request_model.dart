//! creat Class for request quary
class PartnerRequest {
  PartnerRequest({
    required this.cityId,
    required this.countryId,
    required this.gender,
    required this.minAge,
    required this.maxAge,
    required this.date,
    required this.skipCount,
    required this.maxResultCount,
  });
  int cityId;
  int countryId;
  int gender;
  int minAge;
  int maxAge;
  String date;
  int skipCount;
  int maxResultCount;

  //! methode toQuary

  Map<String, dynamic> toQuary() {
    return {
      'CityId': cityId,
      'CountryId': countryId,
      'Gender': gender,
      'MinAge': minAge,
      'MaxAge': maxAge,
      'Date': '',
      'SkipCount': skipCount,
      'MaxResultCount': maxResultCount,
    };
  }
}
