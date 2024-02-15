//! rsponse
class RegisterResponse {
  RegisterResponse({
    required this.result,
    required this.success,
  });
  ResultRegister result;
  bool success;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      result: ResultRegister.fromJson(json['result'] ?? {}),
      success: json['success'] ?? '',
    );
  }
}

class ResultRegister {
  bool? canLogin;

  ResultRegister({this.canLogin});

  ResultRegister.fromJson(Map<String, dynamic> json) {
    canLogin = json['canLogin'];
  }
}
