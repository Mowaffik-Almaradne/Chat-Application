//! login for response
class LoginResponse {
  ResultLogin result;

  LoginResponse({
    required this.result,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(result: ResultLogin.fromJson(json['result'] ?? {}));
  }
}

//! this is object
class ResultLogin {
  ResultLogin({
    required this.accessToken,
    required this.userId,
  });
  String accessToken;
  int userId;

  factory ResultLogin.fromJson(Map<String, dynamic> json) {
    return ResultLogin(
      accessToken: json['accessToken'] ?? '',
      userId: json['userId'] ?? 0,
    );
  }
}
