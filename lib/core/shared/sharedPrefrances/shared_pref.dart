
import 'package:flutter_test_chat1/core/strings/key.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/res/response_get_all_message.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  static late SharedPreferences _sharedPreferences; // instance

//! initilzation shard pref
  static init(SharedPreferences sh) {
    _sharedPreferences = sh;
  }

//! clear all cach
  static clear() {
    _sharedPreferences.clear();
  }

//? this is deparetment cach pref :

  //! Register Token & UserId & Username
  static void cacheAuthUserInfo({
    required String accToken,
    required int userId,
  }) {
    _sharedPreferences.setString(AppKeysManger.accToken, accToken);
    _sharedPreferences.setInt(AppKeysManger.userId, userId);
  }

  //! Register Remember Me Value
  static void cacheRememberMeValue(bool isRememberMe) {
    _sharedPreferences.setBool(AppKeysManger.rememberMe, isRememberMe);
  }

//! partener id
  static void cachePartenerId({
    required int userIdPartener,
  }) {
    _sharedPreferences.setInt(AppKeysManger.partnerId, userIdPartener);
  }

//! partener Name
  static void cachePartenerName({
    required String userNamePartener,
  }) {
    _sharedPreferences.setString(AppKeysManger.partnerName, userNamePartener);
  }

  //! partener Image
  static void cachePartenerImage({required String partenerImage}) {
    _sharedPreferences.setString(AppKeysManger.partenerImage, partenerImage);
  }

//! partener account id
  static void cachePartenerAccountId({required int partenerAccountId}) {
    _sharedPreferences.setInt(
        AppKeysManger.partenerAccountId, partenerAccountId);
  }

  //! partener account id string
  static void cachePartenerIdListString({
    required List<DialogMessageInfo> messagesId,
  }) {
    final idMessage = messagesId.map((e) => e.id).toList();
    _sharedPreferences.setStringList(
        AppKeysManger.cachePartenerIdListString, idMessage);
  }

  static void cachMessageList({required String cachMessageList}) {
    _sharedPreferences.setString(AppKeysManger.messageList, cachMessageList);
  }

//? finshed
//?this is deparetment get of cach pref :
  //! Get Token If It Registered Or Return Empty Value ''
  static String getAccToken() {
    return _sharedPreferences.getString(AppKeysManger.accToken) ?? '';
  }

  //! Get User Id If Registered Or Return Zero Value 0
  static int getUserId() {
    return _sharedPreferences.getInt(AppKeysManger.userId) ?? 0;
  }

//! get Partener Id
  static int getPartenerId() {
    return _sharedPreferences.getInt(AppKeysManger.partnerId) ?? 0;
  }

//! get Partener Name
  static String getPartenerName() {
    return _sharedPreferences.getString(AppKeysManger.partnerName) ?? '';
  }

  //! Get Remember Me Value For Auto Login
  static bool getRememberMeValue() {
    return _sharedPreferences.getBool(AppKeysManger.rememberMe) ?? false;
  }

//! get Partener Image
  static String getPartenerImage() {
    return _sharedPreferences.getString(AppKeysManger.partenerImage) ?? '';
  }

//! get Partener Account Id
  static int getPartenerAccountId() {
    return _sharedPreferences.getInt(AppKeysManger.partenerAccountId) ?? 0;
  }

//! get Partener Id String
  static List<String> getPartenerIdListString() {
    return _sharedPreferences
            .getStringList(AppKeysManger.cachePartenerIdListString) ??
        [];
  }

  static String getMessageList() {
    return _sharedPreferences.getString(AppKeysManger.messageList) ?? '';
  }
  //? finshed

//? delete cach
//! delete user info from cach
  static void deleteCacheAuthUserInfo() {
    _sharedPreferences.remove(AppKeysManger.accToken);
    _sharedPreferences.remove(AppKeysManger.userId);
  }

  //! Make Logout And Clear All The Keys And All Values Stored
  static void logoutSharedPreferences() {
    _sharedPreferences.clear();
  }
  //? finshed
}
