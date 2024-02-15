
//? interface
import 'package:flutter_test_chat1/core/api/api_links.dart';
import 'package:flutter_test_chat1/core/api/api_methods.dart';
import 'package:flutter_test_chat1/core/error/exception.dart';
import 'package:flutter_test_chat1/core/extensions/extensions.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/req/request_fire_base_model.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/req/request_message_model.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/res/response_fire_base.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/res/response_get_all_dialog.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/res/response_get_all_message.dart';
import 'package:flutter_test_chat1/feautres/Message/data/model/res/response_message_model.dart';

abstract class MessageRemote {
  //! send message:
  Future<ResponseMessageInfo> sendMessage({
    required MessageRequest messageModel,
  });

  //! get all messages:
  Future<List<DialogMessageInfo>> getAllMessages();

  //! get all message Dialog:
  Future<List<DialogMessageInfoPartener>> getAllMesageDialog();

  //! send fire base token
  Future<FireBaseInfo> sendFireBaseToken({
    required FireBaseTokenRequest tokenModel,
  });
}

//! send messageImpl
class MessageRemoteImpl extends MessageRemote {
  @override
  Future<ResponseMessageInfo> sendMessage({
    required MessageRequest messageModel,
  }) async {
    var response = await ApiMethods().post(
      url: ApiPost.sendMessageUrl,
      body: messageModel,
      query: {},
    );

    if (response.statusCode == 200) {
      return MessageResponse.fromJson(response.jsonBody).result;
    } else {
      throw ServerException(response: response);
    }
  }

//! get All message Impl : 
  @override
  Future<List<DialogMessageInfo>> getAllMessages() async {
    var response = await ApiMethods().get(
      url: ApiGet.getAllChatListurl,
      query: {},
      path: {},
    );
    if (response.statusCode == 200) {
      return GetAllMessageResponse.fromJson(response.jsonBody).result;
    } else {
      throw ServerException(response: response);
    }
  }

//! get All message Dialog Impl : 
  @override
  Future<List<DialogMessageInfoPartener>> getAllMesageDialog() async {
    var response = await ApiMethods().get(
      url: ApiGet.getAllChatDialogurl,
      query: {},
      path: {},
    );
    

    if (response.statusCode == 200) {
      return ResponseDialogMessage.fromJson(response.jsonBody).result.dialogs;
    } else {
      throw ServerException(response: response);
    }
  }

//! send fire base toke :
  @override
  Future<FireBaseInfo> sendFireBaseToken(
      {required FireBaseTokenRequest tokenModel}) async {
    var response = await ApiMethods().post(
      url: ApiPost.insertFireBaseToke,
      body: {},
      query: tokenModel.toQuary(),
    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return FireBaseTokenResponse.fromJson(response.jsonBody).result;
    } else {
      throw ServerException(response: response);
    }
  }
}
