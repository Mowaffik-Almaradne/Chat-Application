import 'package:dartz/dartz.dart';
import 'package:flutter_test_chat1/core/error/exception.dart';
import 'package:flutter_test_chat1/core/error/failure.dart';
import 'package:flutter_test_chat1/core/network/network_info.dart';
import 'package:flutter_test_chat1/core/strings/failure.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/data/datasource/remote/partner_remote.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/data/model/req/partner_request_model.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/data/model/res/partner_response_model.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/domain/repository/partner_repository.dart';

class PartnerRepositoryImpl implements PartnerRepository {
  final NetworkInfo networkInformationl;
  final PartnerRemote partnerRemote;
  PartnerRepositoryImpl({
    required this.networkInformationl,
    required this.partnerRemote,
  });

  @override
  Future<Either<Failure, List<PartnerInfo>>> partner({
    required PartnerRequest partnerModel,
  }) async {
    if (await networkInformationl.isConnected) {
      try {
        final partnerData =
            await partnerRemote.getAllPartner(partnerModel: partnerModel);
        return Right(partnerData);
      } on ServerException catch (e) {
        return Left(
          Failure(
              error: FaluireWord.serverFaluireMessage, response: e.response),
        );
      }
    } else {
      return const Left(
        Failure(error: FaluireWord.offlineFailureMessage),
      );
    }
  }
}
