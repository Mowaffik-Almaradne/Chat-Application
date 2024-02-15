//! all api links

//! Api GET
class ApiGet {
  //? Region
  static const getAllCitiesUrl = 'services/app/City/GetAllCities';
  static const getAllCountriesUrl = 'services/app/Country/GetAllCountries';
  
  static const getAllPartenerUrl =
      'services/app/CityPartner/GetAllCityPartners';
  static const getImageUrl = 'services/app/UserInformation/DownloadImage/';
  static const getAllChatListurl = 'services/app/Chat/GetAllChatList';
  static const getAllChatDialogurl = 'services/app/Chat/GetDialogByChatId';
}
//!

//! API Post
class ApiPost {
  //? Api Url For Auth
  static const rigesterUrl = "services/app/Account/Register";
  static const loginUrl = "TokenAuth/Authenticate";


  //? message
  static const sendMessageUrl = 'services/app/Chat/PostChat';
  static const insertFireBaseToke = 'services/app/User/InsertFireBaseToken';
}
