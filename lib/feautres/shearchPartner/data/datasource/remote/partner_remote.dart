
import 'package:flutter_test_chat1/core/api/api_links.dart';
import 'package:flutter_test_chat1/core/api/api_methods.dart';
import 'package:flutter_test_chat1/core/error/exception.dart';
import 'package:flutter_test_chat1/core/extensions/extensions.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/data/model/req/partner_request_model.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/data/model/res/partner_response_model.dart';

abstract class PartnerRemote {
  //!  get for partener :
  Future<List<PartnerInfo>> getAllPartner({
    required PartnerRequest partnerModel,
  });
  //!
}

class PartnerRemoteImpl implements PartnerRemote {
  @override
  Future<List<PartnerInfo>> getAllPartner(
      {required PartnerRequest partnerModel}) async {
    var response = await ApiMethods().get(
      url: ApiGet.getAllPartenerUrl,
      query: partnerModel.toQuary(),
      path: {},
    );

    if (response.statusCode == 200) {
      return PartnerResponse.fromJson(response.jsonBody).result;
    } else {
      throw ServerException(response: response);
    }
  }
}
