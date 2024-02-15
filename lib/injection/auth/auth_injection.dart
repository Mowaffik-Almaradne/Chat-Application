

import 'package:flutter_test_chat1/feautres/auth/data/datasource/remote/auth_remote.dart';
import 'package:flutter_test_chat1/feautres/auth/data/repository/auth_repository_imp.dart';
import 'package:flutter_test_chat1/feautres/auth/domain/repository/auth_repository.dart';
import 'package:flutter_test_chat1/feautres/auth/domain/usecases/usecase_auth.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/bloc/image_bloc/cubit/image_cubit.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/bloc/login_bloc/cubit/login_cubit.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/bloc/register_bloc/cubit/register_cubit.dart';
import 'package:flutter_test_chat1/injection/injection_container.dart';

class AuthInjection {
  Future<void> intiAuth() async {
    //! feature - Auth // :

    //? Bloc Register:
    sl.registerFactory(() => RegisterCubit(registerUseCases: sl()));
    //? Bloc login:
    sl.registerFactory(() => LoginCubit(loginUseCases: sl()));
    //? Bloc Image :
    sl.registerFactory(() => ImageCubit(imageUseCases: sl()));

//? UseCase
    sl.registerLazySingleton(() => UsecaseAuth(repository: sl()));

    //? Repo:
    sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authRemote: sl(), networkInformation: sl()),
    );

    //!dataSource :
    //? Remote:
    sl.registerLazySingleton<AuthRemote>(() => AuthRemoteImpl());
  }
}
