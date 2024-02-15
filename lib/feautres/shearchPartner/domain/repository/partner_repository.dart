import 'package:dartz/dartz.dart';
import 'package:flutter_test_chat1/core/error/failure.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/data/model/req/partner_request_model.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/data/model/res/partner_response_model.dart';

abstract class PartnerRepository {
  Future<Either<Failure, List<PartnerInfo>>> partner({
    required PartnerRequest partnerModel,
  });
}
