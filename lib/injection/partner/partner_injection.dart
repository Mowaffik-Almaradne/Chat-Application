
import 'package:flutter_test_chat1/feautres/shearchPartner/data/datasource/remote/partner_remote.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/data/repository/partner_repository_impl.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/domain/repository/partner_repository.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/domain/usecases/partner_usecase.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/presentation/bloc/partnerbloc/cubit/partner_cubit.dart';
import 'package:flutter_test_chat1/injection/injection_container.dart';

class PartnerInjection {
  Future<void> intiPartner() async {
    //? feature - Partner //

//!bloc
    sl.registerFactory(() => PartnerCubit(getAllPartnerUseCase: sl()));

//! UseCase
    sl.registerLazySingleton(() => GetAllPartnerUseCase(repository: sl()));

    //! Repo
    sl.registerLazySingleton<PartnerRepository>(() =>
        PartnerRepositoryImpl(networkInformationl: sl(), partnerRemote: sl()));

//! Remote
    sl.registerLazySingleton<PartnerRemote>(() => PartnerRemoteImpl());
    // local
  }
}
