class PartnerResponse {
  final List<PartnerInfo> result;
  PartnerResponse({
    required this.result,
  });
//! this is for handel info api get all
  factory PartnerResponse.fromJson(Map<String, dynamic> json) {
    return PartnerResponse(
      result: json["result"] == null
          ? []
          : List<PartnerInfo>.from(
              json["result"].map(
                (resultResponse) => PartnerInfo.fromJson(resultResponse),
              ),
            ),
    );
  }
}

//! this is response
class PartnerInfo {
  PartnerInfo({
    required this.prtnerId,
    required this.cityId,
    required this.age,
    required this.gender,
    required this.date,
    required this.userName,
    required this.cityName,
    required this.id,
  });

  final int prtnerId;
  final int cityId;
  final int age;
  final int gender;
  final String date;
  final String userName;
  final String cityName;
  final int id;

  factory PartnerInfo.fromJson(Map<String, dynamic> json) {
    return PartnerInfo(
      prtnerId: json["prtnerId"] ?? 0,
      cityId: json["cityId"] ?? 0,
      age: json["age"] ?? 0,
      gender: json["gender"] ?? 0,
      date: json["date"] ?? "",
      userName: json["userName"] ?? "",
      cityName: json["cityName"] ?? "",
      id: json["id"] ?? 0,
    );
  }
}
