import 'package:dartz/dartz.dart';
import 'package:flutter_test_chat1/core/error/failure.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/data/model/req/partner_request_model.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/data/model/res/partner_response_model.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/domain/repository/partner_repository.dart';

class GetAllPartnerUseCase {
  final PartnerRepository repository;
  GetAllPartnerUseCase({required this.repository});

  Future<Either<Failure, List<PartnerInfo>>> call({
    required PartnerRequest partnerModel,
  }) async {
    return await repository.partner(partnerModel: partnerModel);
  }
}
