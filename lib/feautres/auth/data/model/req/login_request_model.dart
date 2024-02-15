
//! object request: 
class LoginRequest {
  LoginRequest({
    required this.userNameOrEmailAddress,
    required this.password,
    required this.rememberClient,
  });
  String userNameOrEmailAddress;
  String password;
  bool rememberClient;

//! this is function use submet to body
  Map<String, dynamic> toJson() {
    return {
      'userNameOrEmailAddress': userNameOrEmailAddress,
      'password': password,
      'rememberClient': rememberClient,
    };
  }
}
