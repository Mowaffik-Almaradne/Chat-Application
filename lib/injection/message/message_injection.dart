
import 'package:flutter_test_chat1/feautres/Message/data/datasource/remote/message_remote.dart';
import 'package:flutter_test_chat1/feautres/Message/data/repository/message_repository_impl.dart';
import 'package:flutter_test_chat1/feautres/Message/domain/repository/message_repositoy.dart';
import 'package:flutter_test_chat1/feautres/Message/domain/usecases/get_all_message_dialog_usecases.dart';
import 'package:flutter_test_chat1/feautres/Message/domain/usecases/get_all_messages_usecases.dart';
import 'package:flutter_test_chat1/feautres/Message/domain/usecases/message_usecasess.dart';
import 'package:flutter_test_chat1/feautres/Message/domain/usecases/send_fire_base_token_usecases.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/cubit/getallmessagebloc/cubit/getallmessage_cubit.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/cubit/getallmessagedialog/cubit/get_all_message_dialog_cubit.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/cubit/messagebloc/cubit/message_cubit.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/cubit/sendfirebasetoken/cubit/firebasetoken_cubit.dart';
import 'package:flutter_test_chat1/injection/injection_container.dart';

class MessageInjection {
  Future<void> intiMessage() async {
    //? feature - Message //

//!bloc
    sl.registerFactory(() => MessageCubit(messageUseCases: sl()));
    sl.registerFactory(() => GetAllMessagesCubti(getAllMessageUseCases: sl()));
    sl.registerFactory(
        () => GetAllDialogMessageCubit(getAllDialogMessageUseCases: sl()));
    sl.registerFactory(() => FireBaseTokenCubit(tokenUseCases: sl()));

//! UseCase
    sl.registerLazySingleton(() => MessageUseCases(messageRepositry: sl()));
    sl.registerLazySingleton(
        () => GetAllMessagesUseCases(getAllMessagesRepository: sl()));
    sl.registerLazySingleton(
        () => GetAllMessageDialogUseCases(getAllMessageDilaog: sl()));
    sl.registerLazySingleton(
        () => FireBaseTokenUseCases(messageRepositoryFireBaseToken: sl()));

    //! Repo
    sl.registerLazySingleton<MessageRepository>(() =>
        MessageRepositoryImpl(networkInformation: sl(), messageRemote: sl()));

//! Remote
    sl.registerLazySingleton<MessageRemote>(() => MessageRemoteImpl());
    //! local
  }
}
