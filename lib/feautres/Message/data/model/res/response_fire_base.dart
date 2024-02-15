class FireBaseTokenResponse {
  FireBaseTokenResponse({
    required this.result,
  });

  final FireBaseInfo result;

  factory FireBaseTokenResponse.fromJson(Map<String, dynamic> json) {
    return FireBaseTokenResponse(
      result: FireBaseInfo.fromJson(json["result"] ?? {}),
    );
  }
}

//! this is target response :
class FireBaseInfo {
  FireBaseInfo({
    required this.userName,
    required this.name,
    required this.surname,
    required this.emailAddress,
    required this.isActive,
    required this.fullName,
    required this.lastLoginTime,
    required this.creationTime,
    required this.roleNames,
    required this.id,
  });

  final String userName;
  final String name;
  final String surname;
  final String emailAddress;
  final bool isActive;
  final String fullName;
  final dynamic lastLoginTime;
  final DateTime? creationTime;
  final dynamic roleNames;
  final int id;

  factory FireBaseInfo.fromJson(Map<String, dynamic> json) {
    return FireBaseInfo(
      userName: json["userName"] ?? "",
      name: json["name"] ?? "",
      surname: json["surname"] ?? "",
      emailAddress: json["emailAddress"] ?? "",
      isActive: json["isActive"] ?? false,
      fullName: json["fullName"] ?? "",
      lastLoginTime: json["lastLoginTime"],
      creationTime: DateTime.tryParse(json["creationTime"] ?? ""),
      roleNames: json["roleNames"],
      id: json["id"] ?? 0,
    );
  }
}
