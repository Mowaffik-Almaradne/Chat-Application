import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_chat1/core/shared/bloc/navigationbuttoncubit/navigation_button_cubit.dart';
import 'package:flutter_test_chat1/core/shared/bloc/viewbloc/cubit/view_cubit.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/cubit/getallmessagebloc/cubit/getallmessage_cubit.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/cubit/getallmessagedialog/cubit/get_all_message_dialog_cubit.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/cubit/messagebloc/cubit/message_cubit.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/cubit/sendfirebasetoken/cubit/firebasetoken_cubit.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/page/message_page.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/view/send_message_view.dart';
import 'package:flutter_test_chat1/feautres/Message/presentation/view/show_message_view.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/bloc/image_bloc/cubit/image_cubit.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/bloc/login_bloc/cubit/login_cubit.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/bloc/register_bloc/cubit/register_cubit.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/pages/login_or_rigester_page.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/pages/login_page.dart';
import 'package:flutter_test_chat1/feautres/auth/presentation/pages/signup_page.dart';
import 'package:flutter_test_chat1/feautres/home/presentation/page/all_pages_page.dart';
import 'package:flutter_test_chat1/feautres/ragion/Cities/presentation/bloc/cubit/cities_cubit.dart';
import 'package:flutter_test_chat1/feautres/ragion/Country/presentation/bloc/cubit/countries_cubit.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/presentation/bloc/partnerbloc/cubit/partner_cubit.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/presentation/page/partner_page.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/presentation/view/shearch_partner.dart';
import 'package:flutter_test_chat1/feautres/shearchPartner/presentation/widget/not_found_partner_widget.dart';
import 'package:flutter_test_chat1/feautres/splash/presentation/page/splash_page.dart';

import '../injection/injection_container.dart' as di;

// ! navigator for pages and views  :
class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      //?Splash Screen
      case RouteNamedScreens.splashScreenNameRoute:
        return MaterialPageRoute(
          builder: (context) => SplashPage(),
        );
      //?

      //? LoginOrRigester Page
      case RouteNamedScreens.loginOrRigesterScreenNameRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginOrRigesterPage(),
        );
      //?

      //? login Page
      case RouteNamedScreens.loginScreenNameRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => di.sl<LoginCubit>()),
              BlocProvider(create: (_) => di.sl<FireBaseTokenCubit>())
            ],
            child: const LoginPage(),
          ),
        );
      //?

      //? SignUpPage
      case RouteNamedScreens.signUpScreenNameRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => di.sl<RegisterCubit>()),
              BlocProvider(create: (_) => di.sl<CitiesCubit>()..getAllCities()),
              BlocProvider(
                  create: (_) => di.sl<CountriesCubit>()..getAllCountries()),
            ],
            child: const SignUpPage(),
          ),
        );
      //?
      //? Page for navegato to primary page
      case RouteNamedScreens.primaryScreenNameRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => AllPagesCubit()),
              BlocProvider(
                  create: (_) => di.sl<CountriesCubit>()..getAllCountries()),
              BlocProvider(create: (_) => di.sl<CitiesCubit>()..getAllCities()),
              BlocProvider(create: (_) => ViewCubit()),
              BlocProvider(create: (_) => di.sl<PartnerCubit>()),
              BlocProvider(create: (_) => di.sl<ImageCubit>()),
              BlocProvider(create: (_) => di.sl<MessageCubit>()),
              BlocProvider(
                  create: (_) => di.sl<GetAllMessagesCubti>()..getAllMessage()),
              BlocProvider(
                  create: (_) =>
                      di.sl<GetAllDialogMessageCubit>()..getAllMessage()),
            ],
            child: const PrimaryPage(),
          ),
        ); //?
      //? page for search partner
      case RouteNamedScreens.searchPartnerScreenNameRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (_) => di.sl<CountriesCubit>()..getAllCountries()),
              BlocProvider(create: (_) => di.sl<CitiesCubit>()..getAllCities()),
              BlocProvider(create: (_) => ViewCubit()),
              BlocProvider(create: (_) => di.sl<PartnerCubit>()),
              BlocProvider(create: (_) => di.sl<ImageCubit>()),
            ],
            child: const SearchPartnerPage(),
          ),
        );
      //? page not found partener :
      case RouteNamedScreens.notFoundPartenerScreenNmaeRoute:
        return MaterialPageRoute(
          builder: (_) {
            BlocProvider(create: (_) => ViewCubit());
            return const NotFoundPartenerWidget();
          },
        );
      //? page for message partner
      case RouteNamedScreens.messagePartnerScreenNameRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => ViewCubit()),
              BlocProvider(create: (_) => di.sl<ImageCubit>()),
              BlocProvider(create: (_) => di.sl<MessageCubit>()),
              BlocProvider(
                  create: (_) => di.sl<GetAllMessagesCubti>()..getAllMessage()),
              BlocProvider(
                  create: (_) =>
                      di.sl<GetAllDialogMessageCubit>()..getAllMessage()),
            ],
            child: const MessagePage(),
          ),
        );

      ///! view pages //!
      //? view  for search partner
      case RouteNamedScreens.shearchPartnerViewNameRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(providers: [
            BlocProvider(
                create: (_) => di.sl<CountriesCubit>()..getAllCountries()),
            BlocProvider(create: (_) => di.sl<CitiesCubit>()..getAllCities()),
            BlocProvider(
              create: (_) => ViewCubit(),
            ),
            BlocProvider(create: (_) => di.sl<PartnerCubit>()),
            BlocProvider(create: (_) => di.sl<ImageCubit>()),
          ], child: const ShearchPartnerView()),
        );
      //? view  for suggestionsPartner
      case RouteNamedScreens.suggestionsPartnerViewNameRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(providers: [
            BlocProvider(create: (_) => ViewCubit()),
            BlocProvider(create: (_) => di.sl<PartnerCubit>()),
            BlocProvider(create: (_) => di.sl<ImageCubit>()),
          ], child: const ShearchPartnerView()),
        );

      //? view for send message to a partner
      case RouteNamedScreens.sendMessagerViewNameRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => ViewCubit(),
              ),
              BlocProvider(create: (_) => di.sl<MessageCubit>()),
              BlocProvider(
                  create: (_) => di.sl<GetAllMessagesCubti>()..getAllMessage()),
              BlocProvider(
                  create: (_) =>
                      di.sl<GetAllDialogMessageCubit>()..getAllMessage()),
            ],
            child: const SendMessageView(),
          ),
        );
      //? view all meesage of partner
      case RouteNamedScreens.showMessagesViewNameRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => ViewCubit()),
              BlocProvider(create: (_) => di.sl<ImageCubit>()),
              BlocProvider(create: (_) => di.sl<MessageCubit>()),
              BlocProvider(
                  create: (_) => di.sl<GetAllMessagesCubti>()..getAllMessage()),
              BlocProvider(create: (_) => di.sl<GetAllDialogMessageCubit>()),
            ],
            child: const ShowMessageView(),
          ),
        );
    }
    return null;
  }
}

//! Routing Naming
class RouteNamedScreens {
  // ? pages
  static const splashScreenNameRoute = '/';
  static const loginOrRigesterScreenNameRoute = 'loginOrRigester';
  static const loginScreenNameRoute = 'loginScreen';
  static const signUpScreenNameRoute = 'signUpScreen';
  static const primaryScreenNameRoute = 'primaryScreen';
  static const searchPartnerScreenNameRoute = 'searchPartner';
  static const messagePartnerScreenNameRoute = 'messagePartner';
  static const notFoundPartenerScreenNmaeRoute = 'NotFoundPartener';
//!

  // ? views
  static const shearchPartnerViewNameRoute = 'shearchPartnerView';
  static const suggestionsPartnerViewNameRoute = 'suggestionsPartnerView';
  static const sendMessagerViewNameRoute = 'sendMessagerView';
  static const showMessagesViewNameRoute = 'showMessages';
}
