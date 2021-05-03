import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:techtime/screens/Client/CompanyProfile/company_profile.dart';
import 'package:techtime/screens/Client/branchProfile/branch_profile.dart';
import 'package:techtime/screens/Client/branchProfile/subViews/choose_branch.dart';
import 'package:techtime/screens/Client/contact/contact_us.dart';
import 'package:techtime/screens/Client/profileEdit/profile_edit.dart';
import 'package:techtime/screens/Client/walletScreen/wallet_screen.dart';
import 'package:techtime/screens/Core/ConnectivityView/network_sensitive.dart';
import 'package:techtime/screens/Core/notifications/notifications.dart';
import 'package:techtime/screens/Core/search_screen.dart';
import 'package:techtime/screens/Core/startupViews/emailForgetPassworProcess/email_confirm_code.dart';
import 'package:techtime/screens/Core/startupViews/emailForgetPassworProcess/email_forget_password.dart';
import 'package:techtime/screens/Core/startupViews/loginScreen/login_page.dart';
import 'package:techtime/screens/company/company_placeholder.dart';
import 'package:techtime/widgets/core/gallery_view.dart';

import 'screens/Client/Categories/client_categories_screen.dart';
import 'screens/Client/CategoryCompanies/category_companies.dart';
import 'screens/Client/home_page.dart';
import 'screens/Client/saloonProfile/saloonProfile.dart';
import 'screens/Core/startupViews/client_signup_page.dart';
import 'screens/Core/startupViews/language_selection_page.dart';
import 'screens/Core/startupViews/login_moderator_page.dart';
import 'screens/Core/startupViews/sms_verification_screen.dart';
import 'screens/Core/startupViews/splashScreen_page.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case LanguageSelectionPage.routeName:
        return PageTransition(
            type: PageTransitionType.leftToRight,
            duration: Duration(milliseconds: 600),
            child: NetworkSensitive(child: LanguageSelectionPage()));
      case '/loginModerator':
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: LoginModeratorPage(),
        );
      case LoginPage.routeName:
        return PageTransition(
          type: PageTransitionType.fade,
          duration: Duration(milliseconds: 400),
          child: LoginPage(),
        );
      case '/clientRegistration':
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          duration: Duration(milliseconds: 400),
          child: ClientSignupPage(),
        );
      case '/sms':
        return PageTransition(
          type: PageTransitionType.fade,
          duration: Duration(milliseconds: 400),
          child: SmsVerification(),
        );
      case ClientHomePage.routeName:
        return PageTransition(
          type: PageTransitionType.fade,
          child: NetworkSensitive(child: ClientHomePage()),
        );
      case '/categoriesPage':
        return CupertinoPageRoute(
          fullscreenDialog: true,
          builder: (_) => ClientCategoriesScreen(),
        );
      case '/CompaniesListPage':
        return CupertinoPageRoute(
          fullscreenDialog: true,
          builder: (_) => CategoryCompaniesScreen(
            category: args,
          ),
        );
      case CompanyProfile.routeName:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          builder: (_) => CompanyProfile(
            company: args,
          ),
        );
      case CompanyPlaceholder.routeName:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          builder: (_) => CompanyPlaceholder(),
        );
      case BranchProfile.routeName:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          builder: (_) => BranchProfile(),
        );
      case GalleryView.routeName:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          builder: (_) => GalleryView(),
        );
      case SalonProfile.routeName:
        return CupertinoPageRoute(builder: (_) => SalonProfile());
        break;
      case ChooseBranch.routeName:
        return CupertinoPageRoute(builder: (_) => ChooseBranch());
        break;
      case SearchScreen.routeName:
        return CupertinoPageRoute(
            fullscreenDialog: true, builder: (_) => SearchScreen());
        break;
      case Notifications.routeName:
        return CupertinoPageRoute(
            fullscreenDialog: true, builder: (_) => Notifications());
        break;
      case WalletScreen.routeName:
        return CupertinoPageRoute(
            fullscreenDialog: true, builder: (_) => WalletScreen());
        break;
      case ContactUS.routeName:
        return CupertinoPageRoute(
            fullscreenDialog: true, builder: (_) => ContactUS());
        break;
      case EmailForgetPassword.routeName:
        return CupertinoPageRoute(
            fullscreenDialog: true, builder: (_) => EmailForgetPassword());
        break;
      case EmailConfirmCode.routeName:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          builder: (_) => EmailConfirmCode(
            emailAddress: args,
          ),
        );
        break;
      case ProfileEdit.routeName:
        return PageTransition(
            type: PageTransitionType.bottomToTop,
            duration: Duration(milliseconds: 300),
            child: ProfileEdit());
        break;
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
