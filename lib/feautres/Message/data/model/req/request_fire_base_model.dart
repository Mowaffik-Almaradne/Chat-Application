class FireBaseTokenRequest {
  FireBaseTokenRequest({
    required this.firebaseToken,
  });
  final String firebaseToken;

//! this is function request :
  Map<String, dynamic> toQuary() {
    return {
      'firebaseToken': firebaseToken,
    };
  }
}
