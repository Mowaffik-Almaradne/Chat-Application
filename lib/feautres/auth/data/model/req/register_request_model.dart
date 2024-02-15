
//! this is for gender :
enum Gender {
  male,
  female,
  other,
}

//! object request :
class RegisterRequest {
  RegisterRequest({
    required this.name,
    required this.gender,
    required this.cityId,
    required this.countryId,
    required this.phoneNumber,
    required this.emailAddress,
    required this.password,
    required this.avatar,
    required this.age,
  });
  int gender = Gender.male.index;
  int age;
  int cityId;
  int countryId;
  String name;
  String phoneNumber;
  String emailAddress;
  String password;
  String avatar;

//! send to body
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'gender': gender,
      'cityId': cityId,
      'countryId': countryId,
      'phoneNumber': phoneNumber,
      'emailAddress': emailAddress,
      'password': password,
      'avatar': avatar,
      'age': age,
    };
  }
}
